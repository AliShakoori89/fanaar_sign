import 'package:fanar_sign/presentation/bloc/certificate_store/state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../data/model/certificate_model.dart';
import '../../../logic/repository/certificate_repository.dart';
import 'event.dart';

class CertificateBloc extends Bloc<CertificateEvent, CertificateState>{

  CertificateRepository certificateRepository = CertificateRepository();

  CertificateBloc(this.certificateRepository) : super(
    const CertificateState()){
    on<SaveCertificateToStoreEvent>(_mapSaveCertificateToStore);
    on<FetchAllCertificateEvent>(_mapFetchAllCertificate);
    on<ExistCertificateEvent>(_mapExistCertificate);
  }

  void _mapSaveCertificateToStore(
      SaveCertificateToStoreEvent event, Emitter<CertificateState> emit) async {
    try {
      emit(state.copyWith(status: CertificateStatus.loading));
      await certificateRepository.saveCertificateRepo(event.certificateModel);
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
      final List<CertificateDetailsModel> certificates = await certificateRepository.getAllCertificates();
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

  void _mapExistCertificate(
      ExistCertificateEvent event, Emitter<CertificateState> emit) async {
    try{
      emit(state.copyWith(status: CertificateStatus.loading));
      print("333333333333     "+event.nationalCode);
      print("44444444444444444      "+event.selectProduceName);
      final bool existCertificate = await certificateRepository.existCertificate(event.nationalCode, event.selectProduceName);
      emit(
        state.copyWith(
            status: CertificateStatus.success,
            existCertificate: existCertificate
        ),
      );
    }catch (error) {
      emit(state.copyWith(status: CertificateStatus.error));
    }
  }
}