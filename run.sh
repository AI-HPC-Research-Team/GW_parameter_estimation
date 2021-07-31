export CUDA_VISIBLE_DEVICES=0
python3.7 -m inference.gwpe_main train new nde \
    --data_dir data/GW150914_sample_prior_basis/ \
    --model_dir models/GW150914_sample_uniform_100basis_all_uniform_prior_4100_lr005_d01_6block_128mlp_1head/ \
    --basis_dir data/GW150914_sample_prior_basis/ \
    --save_model_name model.pt \
    --save_aux_filename waveforms_supplementary.hdf5 \
    --nbins 8 \
    --dont_sample_extrinsic_only \
    --nsamples_target_event 50000 \
    --nsample 20480 \
    --sampling_from uniform \
    --num_transform_blocks 10 \
    --nflows 15 \
    --batch_norm \
    --batch_size 2048 \
    --output_freq 10 \
    --lr 0.0001 \
    --lr_transformer 0.005 \
    --epochs 10000 \
    --distance_prior_fn uniform_distance \
    --hidden_dims 512 \
    --truncate_basis 100 \
    --activation elu \
    --dropout_transformer 0.1 \
    --num_layers_transformer 6 \
    --num_heads_transformer 1 \
    --ffn_num_hiddens_transformer 128 \
    --lr_anneal_method cosine
# train data sampling from posterior
# for all params dim
## using uniform basis (truncate 100)

## Used for resuming running 
#python3.7 -m inference.gwpe_main train existing \
#     --data_dir data/GW151012_sample_prior_basis/ \
#     --model_dir models/GW151012_sample_uniform_100basis_all_posterior_prior/ \
#     --basis_dir data/GW151012_sample_prior_basis/ \
#     --save_model_name model.pt \
#     --save_aux_filename waveforms_supplementary.hdf5 \
#     --dont_sample_extrinsic_only \
#     --nsamples_target_event 1000 \
#     --nsample 100000 \
#     --sampling_from posterior \
#     --batch_size 2048 \
#     --output_freq 10 \
#     --lr 0.0002 \
#     --epochs 3000 \
#     --distance_prior_fn uniform_distance \
#     --truncate_basis 100 \
#     --lr_anneal_method cosine
