DROP DATABASE IF EXISTS SpotifyClone;

  CREATE DATABASE IF NOT EXISTS SpotifyClone;

  CREATE TABLE SpotifyClone.planos(
      id_plano TINYINT NOT NULL AUTO_INCREMENT,
      plano VARCHAR(30) NOT NULL,
      preço DECIMAL(5,2) NOT NULL,
      PRIMARY KEY (id_plano)
  ) engine = InnoDB;

  CREATE TABLE SpotifyClone.artistas(
    id_artista TINYINT NOT NULL AUTO_INCREMENT,
    artista VARCHAR(50) NOT NULL,
    PRIMARY KEY (id_artista)
  ) engine = InnoDB;
  
  CREATE TABLE SpotifyClone.albuns(
    id_album INT NOT NULL AUTO_INCREMENT,
    album VARCHAR(100) NOT NULL,
    id_artista TINYINT NOT NULL,
    PRIMARY KEY (id_album),
    FOREIGN KEY (id_artista) REFERENCES SpotifyClone.artistas (id_artista)
  ) engine = InnoDB;

  CREATE TABLE SpotifyClone.usuarios(
      id_usuario MEDIUMINT NOT NULL AUTO_INCREMENT,
      usuario VARCHAR(30) NOT NULL,
      idade INT NOT NULL,
      id_plano TINYINT NOT NULL,
      PRIMARY KEY (id_usuario),
      FOREIGN KEY (id_plano) REFERENCES SpotifyClone.planos (id_plano)
  ) engine = InnoDB;

  CREATE TABLE SpotifyClone.canções(
    id_canção INT NOT NULL AUTO_INCREMENT,
    canção VARCHAR(100) NOT NULL,
    duração_segundos INT NOT NULL,
    id_album INT NOT NULL,
    PRIMARY KEY (id_canção),
    FOREIGN KEY (id_album) REFERENCES SpotifyClone.albuns (id_album)
  ) engine = InnoDB;

    CREATE TABLE SpotifyClone.seguidores(
    seguindo INT NOT NULL AUTO_INCREMENT,
    id_usuario MEDIUMINT NOT NULL,
    id_artista TINYINT NOT NULL,
    PRIMARY KEY (seguindo, id_usuario, id_artista),
    FOREIGN KEY (id_usuario) REFERENCES SpotifyClone.usuarios (id_usuario),
    FOREIGN KEY (id_artista) REFERENCES SpotifyClone.artistas (id_artista)
  ) engine = InnoDB;

  CREATE TABLE SpotifyClone.historico_de_reproduções(
    id_reprodução INT NOT NULL AUTO_INCREMENT,
    id_usuario MEDIUMINT NOT NULL,
    musica VARCHAR(60) NOT NULL,
    id_canção INT,
    data VARCHAR(12) NOT NULL,
    hora VARCHAR(15) NOT NULL,
    PRIMARY KEY (id_reprodução, id_usuario),
    FOREIGN KEY (id_usuario) REFERENCES SpotifyClone.usuarios (id_usuario),
    FOREIGN KEY (id_canção) REFERENCES SpotifyClone.canções (id_canção)
  ) engine = InnoDB;

  INSERT INTO SpotifyClone.planos (plano, preço)
  VALUES
  ("gratuito", 0.00),
  ("familiar", 7.99),
  ("universitário", 5.99),
  ("pessoal", 6.99);


  INSERT INTO SpotifyClone.usuarios ( usuario, idade,id_plano)
  VALUES
  ("Barbara Liskov",	82, 1),
  ("Robert Cecil Martin",	58, 1 ),
  ("Ada Lovelace",	37, 2 ),
  ("Martin Fowler",	46, 2),
  ("Sandi Metz",	58, 2),
  ("Paulo Freire",	19, 3),
  ("Bell Hooks",	26, 3),
  ("Christopher Alexander",	85, 4),
  ("Judith Butler",	45, 4),
  ("Jorge Amado",	58, 4);

  INSERT INTO SpotifyClone.artistas (artista)
  VALUES
  ("Beyoncé"),
  ("Queen"),
  ("Elis Regina"),
  ("Baco Exu do Blues"),
  ("Blind Guardian"),
  ("Nina Simone");

  INSERT INTO SpotifyClone.albuns (album, id_artista) 
  VALUES
  ("Renaissance", 1),
  ("Jazz", 2),
  ("Hot Space", 2),
  ("Falso Brilhante", 3),
  ("Vento de Maio", 3),
  ("QVVJFA?", 4),
  ("Somewhere Far Beyond", 5),
  ("I Put A Spell On You", 6);

  INSERT INTO SpotifyClone.canções (canção, duração_segundos, id_album)
  VALUES
  ("BREAK MY SOUL", 279, 1),
  ("VIRGO’S GROOVE", 369, 1),
  ("ALIEN SUPERSTAR", 116, 1),
  ("Don’t Stop Me Now", 203, 2),
  ("Como Nossos Pais", 105, 4),
  ("O Medo de Amar é o Medo de Ser Livre", 207, 5),
  ("Samba em Paris", 267, 6),
  ("The Bard’s Song", 244, 7),
  ("Feeling Good", 100, 8),
  ("Under Pressure", 152, 3);

  INSERT INTO SpotifyClone.seguidores (id_usuario, id_artista)
  VALUES
  (1, 1),
  (1, 2),
  (1, 3),
  (2, 1),
  (2, 3),
  (3, 2),
  (4, 4),
  (5, 5),
  (5, 6),
  (6, 1),
  (6, 6),
  (7, 6),
  (9, 3),
  (10, 2);
  
  INSERT INTO SpotifyClone.historico_de_reproduções (id_usuario, musica, data, hora, id_canção)
  VALUES
  (1, "Samba em Paris", "2022-02-28", "10:45:55", 7),
  (1, "VIRGO'S GROOVE", "2020-05-02", "05:30:35", 2),
  (1, "Feeling Good", "2020-03-06", "11:22:23", 9),
  (2, "Feeling Good", "2022-08-05", "08:05:17", 9),
  (2, "O Medo de Amar é o Medo de Ser Livre", "2020-01-02","07:40:33", 6),
  (3,"Feeling Good","2020-11-13","08:05:17", 9 ),
  (3,"VIRGO’S GROOVE","2020-01-02","07:40:33", 2),
  (4, "Samba em Paris", "2021-08015", "17:10:10", 7),
  (5,"Samba em Paris", "2022-01-09","01:44:33", 7),
  (5, "Under Pressure", "2020-08-06", "15:23:43", 10),
  (6, "O Medo de Amar é o Medo de Ser Livre", "2017-01-24",  "00:31:17", 6),
  (6, "BREAK MY SOUL", "2017-10-12", "12:35:20", 1),
  (7, "Don’t Stop Me Now", "2011-12-15", "22:30:49", 4),
  (8, "Don’t Stop Me Now", "2012-03-17", "14:56:41", 4),
  (9, "The Bard’s Song", "2022-02-24", "21:14:22", 8),
  (10, "ALIEN SUPERSTAR", "2015-12-13", "08:30:22", 3);

  