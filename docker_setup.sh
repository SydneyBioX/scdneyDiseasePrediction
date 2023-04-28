#!/bin/bash

## docker run -e PASSWORD=pushu -e ROOT=TRUE -p 8787:8787 532cb5cec05a
sudo apt-get update
sudo apt-get install libjpeg-dev

#needed by the velocity R package 
#sudo apt-get install -y libboost-dev 
#sudo apt-get install -y libboost-all-dev
## sudo apt-get -y install r-base-dev

## Make a tmp folder and git clone
mkdir /home/gittmp/
git clone https://github.com/SydneyBioX/scdneyDiseasePrediction /home/gittmp/

## wget all data files from Google Cloud Storage into /home/CPC/
#wget https://storage.googleapis.com/scp_data/data.zip -P /home/gittmp/
mkdir /home/gittmp/toy_data
wget https://www.dropbox.com/s/rw7q7b6h4z669t1/schulte_12patients.rds -P /home/gittmp/toy_data
wget https://www.dropbox.com/s/os9guj1vur7d39l/wilk_12patient.rds -P /home/gittmp/toy_data

mkdir /home/gittmp/intermediate_result
wget https://www.dropbox.com/s/plqxtrudhlsp1n8/scfeatures_result_schulte_12patients.rds -P /home/gittmp/intermediate_result
wget https://www.dropbox.com/s/z614phwezuz3su6/scfeatures_result_wilk_12patients.rds -P /home/gittmp/intermediate_result
wget https://www.dropbox.com/s/fphn9b8q5ggdirw/result_list_generalisability.rds -P /home/gittmp/intermediate_result
wget https://www.dropbox.com/s/qzsnybe3h8l88ta/classifyr_result_naivebayes.rds -P /home/gittmp/intermediate_result
wget https://www.dropbox.com/s/tt9jc7vkctgqbkq/classifyr_result_knn.rds -P /home/gittmp/intermediate_result
#wget https://www.dropbox.com/s/91bhx4a2jwj2i63/sce_DentateGyrus_hippocampus.rds -P /home/gittmp/data
#wget https://www.dropbox.com/sh/tr4wq88nd4y2fy6/AABs-4wcFgAr56Qt5DCKWFLza --content-disposition -P /home/gittmp/
#mkdir /home/gittmp/output
#unzip /home/gittmp/output.zip -d /home/gittmp/output

ls /home/
ls /home/gittmp/
  
  ## Set up users
  
sudo groupadd trainees

for((userIndex = 1; userIndex <= 25; userIndex++))
  do
{
  userID=user${userIndex}
  sudo useradd -g trainees -d /home/$userID -m -s /bin/bash $userID
  # sudo cp -r /home/gittmp/* /home/$userID/
  echo $userID:2023 | sudo chpasswd
}
done