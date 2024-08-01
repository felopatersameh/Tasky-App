import 'dart:io';import 'package:flutter/material.dart';import 'package:flutter_bloc/flutter_bloc.dart';import 'package:qr_code_scanner/qr_code_scanner.dart';import 'package:tasky/Core/Utils/Widget/custom_scaffold_messenger.dart';import 'package:tasky/Features/QR/domain/repositories/qr_repo_impl.dart';import 'package:tasky/Features/QR/presentation/manager/qr_cubit.dart';import '../../../../Config/Route/next_screen.dart';import '../../../../Config/Route/route_app.dart';class QRViewExample extends StatefulWidget {  const QRViewExample({super.key});  @override  State<StatefulWidget> createState() => _QRViewExampleState();}class _QRViewExampleState extends State<QRViewExample> {  Barcode? result;  QRViewController? controller;  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');  @override  void reassemble() {    super.reassemble();    if (Platform.isAndroid) {      controller!.pauseCamera();    }    controller!.resumeCamera();  }  @override  Widget build(BuildContext context) {    return BlocProvider(      create: (context) => QrCubit(QrRepoImpl()),      child: BlocConsumer<QrCubit, QrState>(        listener: (context, state) {          if (state is GetOneTaskSuccess) {            pushNext(context, Routes.routeTask, arguments: state.model);          }        },        builder: (context, state) {          return Scaffold(            body: Column(              children: [                Expanded(child: _buildQrView(context)),              ],            ),          );        },      ),    );  }  Widget _buildQrView(BuildContext context) {    var scanArea = (MediaQuery.of(context).size.width < 400 ||            MediaQuery.of(context).size.height < 400)        ? 150.0        : 300.0;    return QRView(      key: qrKey,      onQRViewCreated: _onQRViewCreated,      overlay: QrScannerOverlayShape(          borderColor: Colors.green,          borderRadius: 10,          borderLength: 30,          borderWidth: 10,          cutOutSize: scanArea),      onPermissionSet: (ctrl, p) => _onPermissionSet(context, ctrl, p),    );  }  void _onQRViewCreated(QRViewController controller) {    setState(() {      this.controller = controller;    });    controller.scannedDataStream.listen((scanData) {      setState(() {        result = scanData;      });      result ?? controller.pauseCamera();      QrCubit.get(context).getOneTask(result!.code.toString());    });  }  void _onPermissionSet(BuildContext context, QRViewController ctrl, bool p) {    if (!p) {      showSnackBar(context, 'no Permission');    }  }  @override  void dispose() {    controller?.dispose();    super.dispose();  }}