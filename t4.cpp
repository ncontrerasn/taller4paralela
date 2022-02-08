#include <iostream>
#include <mpi.h>
#include <opencv2/opencv.hpp>
#include <fstream>
#include <sys/time.h>

using namespace std;
using namespace cv;
using std::ofstream;

int main(int argc, char **argv)
{

  // Definimos el conjunto de variables que utilizaremos para manejar las imagenes
  // Esto gracias al tipo de dato Mat que permite manejar la imagen como un objeto con atributos
  cv::Mat imgOrig, imgSobel, imgGray;

  // the total size of the image matrix (rows * columns * channels):
  size_t imageTotalSize;

  // partial size (how many bytes will be sent to each process):
  size_t imagePartialSize;

  // partial buffer, to contain the image.
  // 'uchar' means 'unsigned char', i.e. an 8-bit value, because each pixel in an image is a byte (0..255)
  uchar *partialBuffer;
  uchar *partialBufferSobel;

  size_t rows;
  size_t cols;
  
  //Establecemos las variables de tiempo para las mediciones respectivas
  struct timeval tval_before, tval_after, tval_result;
  gettimeofday(&tval_before, NULL);

  // ------------------------------------

  // start the MPI part
  MPI_Init(&argc, &argv);

  // get the world size and current rank:
  int size;
  int rank;
  MPI_Comm_rank(MPI_COMM_WORLD, &rank);
  MPI_Comm_size(MPI_COMM_WORLD, &size);

  // read the image and its properties in the ROOT process:
  if (rank == 0)
  {
    // read the image
    imgOrig = cv::imread(argv[1], cv::IMREAD_UNCHANGED);

    // check if it's empty:
    if (imgOrig.empty())
    {
      std::cerr << "Image is empty, terminating!" << std::endl;
      return -1;
    }

    rows = imgOrig.rows;
    cols = imgOrig.cols;

    // get the total size of the image matrix (rows * columns * channels)
    // the explanation can be found here: https://stackoverflow.com/a/26441073/4003714
    imageTotalSize = imgOrig.step[0] * imgOrig.rows;

    // check if we can evenly divide the image bytes by the number of processes
    // the image.total() method returns the number of elements, i.e. (rows * cols)
    if (imgOrig.total() % size)
    {
      std::cerr << "Cannot evenly divide the image between the processes. Choose a different number of processes!" << std::endl;
      return -2;
    }

    // get partial size (how many bytes are sent to each process):
    imagePartialSize = imageTotalSize / size;
  }

  // send the "partial size" from #0 to other processes:
  MPI_Bcast(&imagePartialSize, 1, MPI_UNSIGNED_LONG_LONG, 0, MPI_COMM_WORLD);
  MPI_Bcast(&imageTotalSize, 1, MPI_UNSIGNED_LONG_LONG, 0, MPI_COMM_WORLD);
  // unsigned char h_imgOrig[imageTotalSize];

  MPI_Bcast(&rows, 1, MPI_UNSIGNED_LONG_LONG, 0, MPI_COMM_WORLD);
  MPI_Bcast(&cols, 1, MPI_UNSIGNED_LONG_LONG, 0, MPI_COMM_WORLD);

  // synchronize the processes here, to make sure that the sizes are initialized:
  MPI_Barrier(MPI_COMM_WORLD);

  // allocate the partial buffer:
  partialBuffer = new uchar[imagePartialSize];

  // allocate the partial buffer:
  partialBufferSobel = new uchar[imagePartialSize];

  // synchronize the processe here, to make sure each process has allocated the buffer:
  MPI_Barrier(MPI_COMM_WORLD);

  // scatter the image between the processes:
  MPI_Scatter(imgOrig.data, imagePartialSize, MPI_UNSIGNED_CHAR, partialBuffer, imagePartialSize, MPI_UNSIGNED_CHAR, 0, MPI_COMM_WORLD);

  // synchronize the image processing:
  MPI_Barrier(MPI_COMM_WORLD);

  // -----------------------------------------------------------------------------------------------------------------------------------------------
  // AND NOW HERE EACH PROCESS HAS ITS OWN PART OF THE IMAGE!

  for (size_t i = 0; i < imagePartialSize; i += 3)
  {
    uchar r = partialBuffer[i + 0];
    uchar g = partialBuffer[i + 1];
    uchar b = partialBuffer[i + 2];

    partialBuffer[i + 0] = r * 0.299f + g * 0.587f + b * 0.114f;
    partialBuffer[i + 1] = r * 0.299f + g * 0.587f + b * 0.114f;
    partialBuffer[i + 2] = r * 0.299f + g * 0.587f + b * 0.114f;
  }

  // -----------------------------------------------------------------------------------------------------------------------------------------------

  // synchronize the image processing:
  MPI_Barrier(MPI_COMM_WORLD);

  // initialize the output image (only need to do it in the ROOT process)
  if (rank == 0)
  {
    imgGray = cv::Mat(imgOrig.size(), imgOrig.type());
  }

  // and now we finally send the partial buffers back to the ROOT, gathering the complete image:
  MPI_Gather(partialBuffer, imagePartialSize, MPI_UNSIGNED_CHAR, imgGray.data, imagePartialSize, MPI_UNSIGNED_CHAR, 0, MPI_COMM_WORLD);

  // scatter the image between the processes:
  MPI_Scatter(imgGray.data, imagePartialSize, MPI_UNSIGNED_CHAR, partialBuffer, imagePartialSize, MPI_UNSIGNED_CHAR, 0, MPI_COMM_WORLD);

  // scatter the image between the processes:
  MPI_Scatter(imgGray.data, imagePartialSize, MPI_UNSIGNED_CHAR, partialBufferSobel, imagePartialSize, MPI_UNSIGNED_CHAR, 0, MPI_COMM_WORLD);

  // synchronize the image processing:
  MPI_Barrier(MPI_COMM_WORLD);

  float Kernel[3][3];
  float Kernel2[3][3];
  Kernel[0][0] = -1;
  Kernel[0][1] = 0;
  Kernel[0][2] = 1;
  Kernel[1][0] = -2;
  Kernel[1][1] = 0;
  Kernel[1][2] = 2;
  Kernel[2][0] = -1;
  Kernel[2][1] = 0;
  Kernel[2][2] = 1;
  Kernel2[0][0] = -1;
  Kernel2[0][1] = -2;
  Kernel2[0][2] = -1;
  Kernel2[1][0] = 0;
  Kernel2[1][1] = 0;
  Kernel2[1][2] = 0;
  Kernel2[2][0] = 1;
  Kernel2[2][1] = 2;
  Kernel2[2][2] = 1;

  int YoffSet = cols * 3;
  int x;

  for (x = 0; x < imagePartialSize; x = x + 3)
  {
    // Se debe realizar la operacion por cada uno de los colores RGB que se encuentran en cada pixel
    for (int f = 0; f < 3; f++)
    {
      float sum = 0.0;
      float sum2 = 0.0;
      float fsum = 0.0;
      // Se establece con estos dos fors la operacion de convolucion entre la matriz de la imagen y los kernels
      for (int k = -1; k <= 1; k++)
      {
        for (int j = -1; j <= 1; j++)
        {
          if ((0 <= (x + YoffSet * j + k * 3 + f)) && ((x + YoffSet * j + k * 3 + f) < imagePartialSize))
          {
            sum = sum + Kernel[j + 1][k + 1] * partialBuffer[x + YoffSet * j + k * 3 + f];
            sum2 = sum2 + Kernel2[j + 1][k + 1] * partialBuffer[x + YoffSet * j + k * 3 + f];
          }
        }
      }
      // Segun dicta el algoritmo se aplica la siguiente operacion
      fsum = ceilf(sqrt((sum * sum) + (sum2 * sum2)));
      // el valor resultante se substituye en el pixel correspondiente de la imagen objetivo
      partialBufferSobel[x + f] = fsum;
    }
  }

  // synchronize the image processing:
  MPI_Barrier(MPI_COMM_WORLD);

  // initialize the output image (only need to do it in the ROOT process)
  if (rank == 0)
  {
    imgSobel = cv::Mat(imgOrig.size(), imgOrig.type());
  }

  // and now we finally send the partial buffers back to the ROOT, gathering the complete image:
  MPI_Gather(partialBufferSobel, imagePartialSize, MPI_UNSIGNED_CHAR, imgSobel.data, imagePartialSize, MPI_UNSIGNED_CHAR, 0, MPI_COMM_WORLD);

  // Save and display image, onle in the ROOT process
  if (rank == 0)
  {
    // save the image:
    string string1(argv[1]);
    string1 = string1.substr(0, string1.size() - 4);
    string1 += "grayscale.png";
    
    cv::imwrite(string1, imgGray);
    cv::imwrite(argv[2], imgSobel);

    cv::destroyAllWindows();
    
    gettimeofday(&tval_after, NULL);
    timersub(&tval_after, &tval_before, &tval_result);
    
    ofstream myfile;
    myfile.open("tiempos.txt", std::ios_base::app);
    myfile << "Imagen: " << argv[1] << " - ";
    myfile << "Tiempo: " << tval_result.tv_sec << "." << tval_result.tv_usec << " s - ";
    myfile << "Procesos: " << size << "\n";
    myfile.close();
  }

  delete[] partialBuffer;

  MPI_Finalize();
}
