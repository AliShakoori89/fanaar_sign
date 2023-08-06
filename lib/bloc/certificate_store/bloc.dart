import 'package:fanar_sign/bloc/certificate_store/state.dart';
import 'package:fanar_sign/model/certificate_model.dart';
import 'package:fanar_sign/repository/certificate_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'event.dart';

class CertificateBloc extends Bloc<CertificateEvent, CertificateState>{

  CertificateRepository certificateRepository = CertificateRepository();

  CertificateBloc(this.certificateRepository) : super(
    const CertificateState()){
    on<SaveCertificateToStoreEvent>(_mapSaveCertificateToStore);
    on<FetchAllCertificateEvent>(_mapFetchAllCertificate);
  }

  void _mapSaveCertificateToStore(
      SaveCertificateToStoreEvent event, Emitter<CertificateState> emit) async {
    try {
      await certificateRepository.saveCertificateRepo(event.certificateModel);
      emit(state.copyWith(status: CertificateStatus.loading));

      emit(
        state.copyWith(
          status: CertificateStatus.success,
        ),
      );
    } catch (error) {
      emit(state.copyWith(status: CertificateStatus.error));
    }
  }

  void _mapFetchAllCertificate(
      FetchAllCertificateEvent event, Emitter<CertificateState> emit) async {
    try{
      emit(state.copyWith(status: CertificateStatus.loading));
      final List<CertificateModel> certificates = await certificateRepository.getAllCertificates(event.serial);
      emit(
        state.copyWith(
            status: CertificateStatus.success,
            storeCertificate: certificates
        ),
      );
    }catch (error) {
      emit(state.copyWith(status: CertificateStatus.error));
    }
  }
}