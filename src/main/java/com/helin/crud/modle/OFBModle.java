package com.helin.crud.modle;

import java.io.UnsupportedEncodingException;

import com.helin.crud.cord.crypto.AESCipherService;
import com.helin.crud.cord.crypto.CipherService;

public class OFBModle {
	public void OFB(String plaintext, String key) throws UnsupportedEncodingException {
		// 将明文转换为char
		char[] chplain = plaintext.toCharArray();
		// 明文长度
		int lenght = plaintext.length();
		// 分组数
		int block;
		if (lenght % 16 == 0) {
			block = lenght / 16;
		} else {
			block = lenght / 16 + 1;
		}
		// 密文
		char[] ciphertext = new char[lenght];
		// 明文分组
		char[][] plainblock = new char[block][16];
		// 位置变量
		int dataCount = 0;
		// 将第i位数据存入明文分组中对应的位置
		for (int k = 0; k < block; k++) {
			for (int t = 0; t < 16; t++) {
				plainblock[k][t] = chplain[dataCount];
				dataCount++;
			}
		}
		// iv
		//char [] iv = 
		String striv = "1237654899876540";
		dataCount = 0;
		// 初始异或运算
		for (int i = 0; i < lenght; i = i + 16) {
			// 行
			int r = i / 16;
			//编码片段
			char []enplain = new char[16];
			//-------------对计数器进行AES加密---------------------
			CipherService aesService = new AESCipherService();
		    String encryptedText = aesService.encrypt(striv, key);
		    char []cencryptedText = encryptedText.toCharArray();
		    //System.out.println(cencryptedText.length);
			//加密后的计数器与明文进行异或运算
			for (int k = 0; k < 16; k++) {
				enplain[k] =String.valueOf(plainblock[r][k] ^ cencryptedText[k]).charAt(0);
			}
			
			// 添加到密文表中
			for (int p = 0; p < 16; p++) {
				ciphertext[dataCount] = enplain[p];
				dataCount++;
			}
			//将前一轮IV密文作为下一轮的iv
			striv = encryptedText;
		}
//		System.out.println("AES-------OFB模式加密产生的密文为：");
//	    String strCiphertext = String.valueOf(ciphertext);
//	    System.out.println(strCiphertext);
	}
}
