package com.helin.crud.modle;

import java.io.UnsupportedEncodingException;

import com.helin.crud.cord.crypto.AESCipherService;
import com.helin.crud.cord.crypto.CipherService;

public class ECBModle {

	public void ECB(String plaintext,String key) throws UnsupportedEncodingException {
		//将明文转换为char
		char [] chplain = plaintext.toCharArray();
		//明文长度
		int lenght = plaintext.length();
		//分组数
		int block;
		if(lenght%16==0) {
			block = lenght/16;
		}else {
			block = lenght/16 +1;
		}
		//密文
		char [] ciphertext = new char[lenght];//+(16-lenght%16)
		//明文分组
		char [][]plainblock =new char[block][16];
		//位置变量
		int dataCount =0;
		//将第i位数据存入明文分组中对应的位置
		for(int k=0;k<block;k++) {
			for(int t=0;t<16;t++) {
				plainblock[k][t] = chplain[dataCount];
				dataCount++;
			}
		}
		dataCount = 0;
		for(int i=0;i<lenght;i=i+16) {
			//行
			int r = i/16;
			//列
			//int l = 0;
			//编码片段
			char []enplain = new char[16];
			for(int j=0;j<16;j++) {
				enplain[j] = plainblock[r][j];
				//l++;
			}
			String strblock =String.valueOf(enplain);
			//-------------AES加密---------------------
			CipherService aesService = new AESCipherService();
		    String encryptedText = aesService.encrypt(strblock, key);
		    //ArrayUtil.printInfo("encrypted text", encryptedText, false);
		    //-----------------添加到密文列表中-------------------------
		    char [] charEncry = encryptedText.toCharArray();
		    //System.out.println(charEncry.length);
		    for(int p=0;p<16;p++) {
		    	ciphertext[dataCount] = charEncry[p];
		    	dataCount++;
		    }
		}
//		System.out.println("AES-------ECB模式加密产生的密文为：");
//	    String strCiphertext = String.valueOf(ciphertext);
//	    System.out.println(strCiphertext);
		
	}
}
