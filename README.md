# Taller 4 Parelela

## Para probar individualmente:

Compilar con: sudo mpic++ taller4.cpp -o t4 \`pkg-config --cflags --libs opencv\`

Correr con: mpirun -np 2 --hostfile mpi_hosts ./t4 720p.jpg 720p sobel.jpg

**Nota:** los parámetros son: nombre de la imagen de entrada, nombre de la imagen de de salida y número de procesos.

## Para correr todo con el script:

Dar permiso al script con: chmod 755 script_ejecutar_todo.sh 

Ejecutar con: ./script_ejecutar_todo.sh
