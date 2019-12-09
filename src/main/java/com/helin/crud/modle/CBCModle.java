package com.helin.crud.modle;

import java.io.UnsupportedEncodingException;

import com.helin.crud.cord.crypto.AESCipherService;
import com.helin.crud.cord.crypto.CipherService;

public class CBCModle {

	public void CBC(String plaintext, String key) throws UnsupportedEncodingException {
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
		//iv
		String striv = "0123456789987654";
		char iv[] = striv.toCharArray();
		dataCount = 0;
		
		//初始异或运算
	    for(int i=0;i<lenght;i=i+16)
	    {
	        int r = i/16;//行
	        int l = 0;//列
	        //编码片段
			char []enplain = new char[16];
	        //初始化异或运算
	        for(int k=0;k<16;k++)
	        {
	        	plainblock[r][k] =(char) (plainblock[r][k] ^ iv[k]);
	        }
	         //与Key加密的行
	        for(int j=0;j<16;j++)
	        {
	            enplain[j] = plainblock[r][j];
	        }
	        String strblock = String.valueOf(enplain);
			//-------------AES加密---------------------
			CipherService aesService = new AESCipherService();
		    String encryptedText = aesService.encrypt(strblock, key);
	        //添加到密文表中
		    char [] charEncry = encryptedText.toCharArray();
		    //System.out.println(charEncry.length);
	        for(int p=0;p<16;p++)
	        {
	            ciphertext[dataCount] = charEncry[p];
	            dataCount++;
	        }
	        //变换初始输入
	        for(int t=0;t<16;t++)
	        {
	        	iv[t] = enplain[t];
	        }
	    }
//	    System.out.println("AES-------CBC模式加密产生的密文为：");
//	    String strCiphertext = String.valueOf(ciphertext);
//	    System.out.println(strCiphertext);
		
		
	}
}
