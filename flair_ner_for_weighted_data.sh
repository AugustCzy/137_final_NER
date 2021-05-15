File Edit Options Buffers Tools Sh-Script Help                                                                                                                                                                     
export CONLL03_TRAIN_FILE=data/conllpp_train.txt
export CONLL03_DEV_FILE=data/conllpp_dev.txt
export CONLL03_TEST_FILE=data/conllpp_test.txt
export DATA_FOLDER_PREFIX=splitdata
export MODEL_FOLDER_PREFIX=model
export WEIGHED_MODEL_FOLDER_NAME=weighed


for epss in $(seq 0.1 0.2 0.9); do
        EPS_FOLDER=${WEIGHED_MODEL_FOLDER_NAME}/train-${epss}.bio
        python flair_scripts/flair_ner_loop_train_eps_file.py --folder_name ${WEIGHED_MODEL_FOLDER_NAME} \
                                        --data_folder_prefix ${DATA_FOLDER_PREFIX} \
                                        --model_folder_prefix ${MODEL_FOLDER_PREFIX} \
                                        --train_file train-${epss}.bio
					--include_weight
done
