#!/usr/bin/env bash

read -p "1) Do you really want to remove content (y/n)? " answer
case ${answer:0:1} in
    y|Y )
      echo "   INFO: Stopping containers"
      docker-compose stop
      echo "   INFO: Removing containers"
      docker-compose rm -f
      echo "   INFO: Pruning unused docker volumes"
      docker volume prune -f
      echo "   INFO: Pruning unused docker networks"
      docker network prune -f
      echo "   INFO: Removing directories and contents (mysql/)"
      rm -rf web1/mysql/*
      rm -rf web2/mysql/*
      echo "   INFO: Done"
    ;;
    * )
      echo "INFO: Exiting not removing files"
    ;;
esac
exit 0;
