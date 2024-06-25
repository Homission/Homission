const functions = require("firebase-functions");
const admin = require("firebase-admin");
require('dotenv').config();

admin.initializeApp();

exports.sendOtp = functions.https.onCall(async (data, context) => {
  const email = data.email;
  const otp = Math.floor(100000 + Math.random() * 900000).toString();

  await admin.database().ref("otps/" + email.replace(".", "+")).set({
    otp: otp,
    timestamp: admin.database.ServerValue.TIMESTAMP,
  });

  const nodemailer = require("nodemailer");
  const transporter = nodemailer.createTransport({
    service: "gmail",
    auth: {
      user: "kwonyh15@hanyang.ac.kr",
      pass: "rnrkqdjwdhq15!",
    },
  });

  const mailOptions = {
    from: "kwonyh15@hanyang.ac.kr",
    to: email,
    subject: "Homission - 이메일 인증코드",
    text: `안녕하세요,

           Homission에 가입해 주셔서 감사합니다. 아래의 인증코드를 입력하여 이메일 인증을 완료해 주세요.

           인증코드: [${otp}]

           인증코드는 10분 동안 유효합니다. 이 시간 안에 인증을 완료해 주세요.

           감사합니다.
           Homission 팀

           문의사항이 있으시면 kyh96kyh@gmail.com으로 연락해 주세요.`,
  };

  try {
    await transporter.sendMail(mailOptions);
    return {success: true};
  } catch (error) {
    return {success: false, error: error.toString()};
  }
});
