package com.helin.crud.modle;

import java.io.UnsupportedEncodingException;

import com.helin.crud.cord.crypto.AESCipherService;
import com.helin.crud.cord.crypto.CipherService;
import com.helin.crud.util.Counter;

public class CTRModle {
	public void CTR(String plaintext, String key) throws UnsupportedEncodingException {
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
		String striv = "012345heli987654";
		//byte iv[] = striv.getBytes("utf-8");
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
			//加密后的计数器与明文进行异或运算
			for (int k = 0; k < 16; k++) {
				plainblock[r][k] =String.valueOf(plainblock[r][k] ^ cencryptedText[k]).charAt(0);
			}
	        for(int j=0;j<16;j++)
	        {
	            enplain[j] = plainblock[r][j];
	        }
			// 添加到密文表中
			for (int p = 0; p < 16; p++) {
				ciphertext[dataCount] = enplain[p];
				dataCount++;
			}
			char iv [] = striv.toCharArray();
			//System.out.println(iv[15]);
			Counter counter = new Counter();
			counter.add(iv);
			striv = String.valueOf(iv);
			//System.out.print(striv+" ");
		}
//		System.out.println("AES-------CTR模式加密产生的密文为：");
//	    String strCiphertext = String.valueOf(ciphertext);
//	    System.out.println(strCiphertext);
	}
}
