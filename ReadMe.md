# O objetivo desse projeto é disponibilizar de forma flexivel os testes utilizando o Robot Framework
  - Build da imagem:
  ```
  docker build -t robot .
  ```
  - Rodar os testes
  ```
  file=robot.robot 
  docker run  -v $(pwd):/app:cached -w /app  robot $file
  ```
