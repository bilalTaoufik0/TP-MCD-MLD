lancer les containers

docker compose up -d 


sauvegarder la bsdonne

docker exec -i mysql-container mysqldump -u root -proot airlockunlock > backup_full.sql  

docker-compose down
 
apres tu commit et tu push 

recuperer ma base de donnés sur un autre pc

docker exec -i mysql-container mysql -u root -proot airlockunlock < backup_full.sql 