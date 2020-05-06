# automatically generate models from database
sequelize-auto -h localhost -d fitmoji -u root -x root -p 8889 --dialect mysql
-o ./app/model
