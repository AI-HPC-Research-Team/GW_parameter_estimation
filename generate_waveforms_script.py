import lfigw.waveform_generator as wfg

wfd = wfg.WaveformDataset(spins_aligned=False, domain='RB',
                          extrinsic_at_train=True)

wfd.Nrb = 600
wfd.approximant = 'IMRPhenomPv2'

wfd.load_event('data/events/GW150914/', randpsd=False)

wfd.importance_sampling = 'uniform_distance'

wfd.prior['mass_1'] = [5, 80]
wfd.prior['mass_2'] = [5, 80]
wfd.prior['distance'] = [100.0, 5000.0]
wfd.prior['a_1'][1] = 0.88
wfd.prior['a_2'][1] = 0.88

print('Dataset properties')
print('Event', wfd.event)
print(wfd.prior)
print('f_min', wfd.f_min)
print('f_min_psd', wfd.f_min_psd)
print('f_max', wfd.f_max)
print('delta_f', wfd.delta_f)
print('T', wfd.time_duration)
print('reference time', wfd.ref_time)

wfd.generate_reduced_basis(100000)
input('control + c!')
wfd.generate_dataset(1000000)

wfd.generate_noisy_test_data(5000)

wfd.save('waveforms/GWTC1_150914')
input('Have saved for basis!')
wfd.save_train('waveforms/GWTC1_150914')
wfd.save_noisy_test_data('waveforms/GWTC1_150914')

print('Program complete. Waveform dataset has been saved.')
