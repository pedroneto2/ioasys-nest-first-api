## Link do deploy: https://ioasys-nest-first-api.herokuapp.com/orders/

## como "DOCKERIZAR" o app

- Instale o docker, no meu caso estou utilizando windows. Basta baixar e instalar: https://www.docker.com/products/docker-desktop

### RODAR LOCALMENTE

Para rodar o app localmente é necessário "setar" a variavel de ambient utilizada para PORTA e EXPÔ-LA no dockerfile e dockercompose:

No arquivo Dockerfile adicione

```bash
$ ENV PORT = <numero-da-porta>
```

No arquivo docker-compose.yml adicione em services: > ioasysnestfirstapi: >

```bash
$ ports:
$   - <porta-do-container>:<porta-da-sua-maquina>
$ enviroment:
$   - PORT: <porta-do-container>
```

OBS: Eu utilizei a mesma porta para tudo, por exemplo: 3000

agora execute o comando

```bash
$ docker-compose up
```

obs: se não der certo, será necessário executar este comando antes do comando anterior:

```bash
$ docker build -t <tag-de-sua-escolha>
```



### COMO FAZER O DEPLOY NO HEROKU

- baixe e instale o heroku cli: https://devcenter.heroku.com/articles/getting-started-with-nodejs#set-up

faça o clone desse repositório sem mudar nenhum arquivo.

OBS: Não expoem-se portas com o Dockerfile ou docker-compse.yml para deploy no heroku, pois o próprio heroku vai fazer isso

Só é necessário indicar uma porta em main.ts como variavel de ambiente para o heroku utilizar, no caso: process.env.PORT

e no arquivo app.module.ts é preciso importar a dependencia para lidar com variaveis de ambiente. Adicione:

```bash
$ import { ConfigModule } from '@nestjs/config';
```

e em imports, no @Module, adicione

```bash
$ ConfigModule.forRoot()
```

e instale a dependencia @nestjs/config:

```bash
$ npm install @nestjs/config
```

agora, no terminal na raiz do diretorio do projeto, faça login no heroku:

```bash
$ heroku login
```

Pressione qualquer tecla para abrir o browser, faça login pelo browser e pronto, você estará logado no terminal.

faça login no registro dos containeres do heroku:

```bash
$ heroku container:login
```

adicione seu projeto

```bash
$ heroku container:push web
```

publique-o

```bash
$ heroku container:push web
```

e agora, o abra

```bash
$ heroku open
```

## Description

[Nest](https://github.com/nestjs/nest) framework TypeScript starter repository.

## Instalação

```bash
$ npm install
```

## Rodando o APP com DOCKER

```bash
$ docker-compose up
```

## License

Nest is [MIT licensed](LICENSE).
