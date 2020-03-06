DROP TABLE IF EXISTS nouns;
DROP TABLE IF EXISTS determiners;

CREATE TABLE nouns (
  id SERIAL PRIMARY KEY,
  english VARCHAR(255),
  gender VARCHAR(255),
  na_sing_indef VARCHAR(255),
  na_sing_def VARCHAR(255),
  na_plu_indef VARCHAR(255),
  na_plu_def VARCHAR(255)
);

CREATE TABLE determiners (
  id SERIAL PRIMARY KEY,
  english VARCHAR(255),
  person VARCHAR(255),
  masc_sing VARCHAR(255),
  masc_plu VARCHAR(255),
  fem_sing VARCHAR(255),
  fem_plu VARCHAR(255)
);
