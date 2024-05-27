import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class CertificationScreen extends StatefulWidget {
  const CertificationScreen({super.key});

  @override
  _CertificationScreenState createState() => _CertificationScreenState();
}

class _CertificationScreenState extends State<CertificationScreen> {
  final ImagePicker _picker = ImagePicker();
  List<XFile> _imageFileList = [];
  final TextEditingController _textController = TextEditingController();

  void _pickImage() async {
    final List<XFile>? selectedImages = await _picker.pickMultiImage();
    if (selectedImages != null && selectedImages.isNotEmpty) {
      setState(() {
        _imageFileList.addAll(selectedImages);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        title: const Text(
          '인증',
          style: TextStyle(
            color: Color.fromRGBO(17, 17, 17, 1),
            fontFamily: 'Pretendard',
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: LayoutBuilder(
          builder: (context, constraints) {
            return SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  minHeight: constraints.maxHeight,
                ),
                child: IntrinsicHeight(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      const SizedBox(height: 32), // 상단 앱바와의 여백
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 12, vertical: 4),
                            decoration: BoxDecoration(
                              color: const Color.fromRGBO(208, 230, 255, 1),
                              borderRadius: BorderRadius.circular(100),
                            ),
                            child: const Text(
                              '참여중',
                              style: TextStyle(
                                color: Color.fromRGBO(72, 156, 255, 1),
                                fontFamily: 'Pretendard',
                                fontSize: 12,
                                fontWeight: FontWeight.bold
                              ),
                            ),
                          ),
                          const Text(
                            '현재 888명 참여',
                            style: TextStyle(
                              color: Color.fromRGBO(135, 135, 135, 1),
                              fontFamily: 'Pretendard',
                              fontSize: 12,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 16),
                      const Text(
                        '온라인 구직신청',
                        style: TextStyle(
                          color: Color.fromRGBO(17, 17, 17, 1),
                          fontFamily: 'Pretendard',
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 4),
                      const Text(
                        '‘온라인 구직신청’ 을 완료 후 화면을 캡쳐하여 업로드해주세요!',
                        style: TextStyle(
                          color: Color.fromRGBO(40, 40, 40, 1),
                          fontFamily: 'Pretendard',
                          fontSize: 14,
                        ),
                      ),
                      const SizedBox(height: 32),
                      SizedBox(
                        height: 120,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: _imageFileList.length + 1,
                          itemBuilder: (context, index) {
                            if (index == _imageFileList.length) {
                              return GestureDetector(
                                onTap: _pickImage,
                                child: Container(
                                  margin: const EdgeInsets.only(right: 8),
                                  width: 120,
                                  height: 120,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8),
                                    border: Border.all(
                                      color: const Color.fromRGBO(
                                          226, 226, 226, 1),
                                    ),
                                  ),
                                  child: const Center(
                                    child: Icon(
                                      Icons.camera_alt,
                                      color: Color.fromRGBO(226, 226, 226, 1),
                                    ),
                                  ),
                                ),
                              );
                            } else {
                              return Container(
                                margin: const EdgeInsets.only(right: 8),
                                width: 120,
                                height: 120,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  image: DecorationImage(
                                    image: FileImage(
                                        File(_imageFileList[index].path)),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              );
                            }
                          },
                        ),
                      ),
                      const SizedBox(height: 32),
                      Expanded(
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 24, vertical: 24),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: const Color.fromRGBO(245, 245, 245, 1),
                          ),
                          child: TextField(
                            controller: _textController,
                            maxLines: null, // 입력 줄바꿈 가능하게 설정
                            expands: true, // 텍스트 필드가 남은 모든 공간을 차지
                            decoration: const InputDecoration(
                              hintText: '미션 수행 후기를 남겨주세요!',
                              hintStyle: TextStyle(
                                color: Color.fromRGBO(190, 190, 190, 1),
                                fontFamily: 'Pretendard',
                                fontSize: 14,
                              ),
                              border: InputBorder.none,
                            ),
                            style: const TextStyle(
                              color: Color.fromRGBO(0, 0, 0, 1),
                              fontFamily: 'Pretendard',
                              fontSize: 14,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 16), // 하단 여백
                      SizedBox(
                        height: 58, // 버튼 높이 58로 설정
                        width: double.infinity,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor:
                                const Color.fromRGBO(17, 17, 17, 1),
                            padding: const EdgeInsets.symmetric(vertical: 16),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          onPressed: () {
                            // 인증하기 버튼 클릭 시 처리 로직 추가
                          },
                          child: const Text(
                            '인증하기',
                            style: TextStyle(
                              color: Colors.white,
                              fontFamily: 'Pretendard',
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 16), // 하단 여백
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

void main() {
  runApp(const MaterialApp(
    home: CertificationScreen(),
  ));
}
