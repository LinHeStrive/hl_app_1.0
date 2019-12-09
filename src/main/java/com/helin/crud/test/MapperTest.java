package com.helin.crud.test;

import java.io.BufferedReader;
import java.io.FileReader;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.helin.crud.cord.crypto.AESCipherService;
import com.helin.crud.cord.crypto.CipherService;
import com.helin.crud.modle.CBCModle;
import com.helin.crud.modle.CFBModle;
import com.helin.crud.modle.CTRModle;
import com.helin.crud.modle.ECBModle;
import com.helin.crud.modle.OFBModle;
import com.helin.crud.util.Encrypt;
import com.helin.crud.util.Pbkdf2Sha256;

/**
 * 测试dao层的工作
 * 
 * @author hl777 1、导入springtest 2、@ContextConfiguration制定spring配置文件的地址
 *         3、直接autowired要使用的组件
 */
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "classpath:applicationContext.xml" })
public class MapperTest {

	public static void main(String[] args) throws IOException {
		// 文件数据读取
		String fileName = "C:\\Users\\hl777\\Desktop\\30k.txt";
		
		FileReader fileReader = new FileReader(fileName);

		BufferedReader bufferedReader = new BufferedReader(fileReader);

		String line = "";
		StringBuilder context = new StringBuilder();
		while (line != null) {
			line = bufferedReader.readLine();
			if (line == null) {
				break;
			}
			context.append(line);// .append('\n');
		}
//		String fileName2 = "C:\\Users\\hl777\\Desktop\\200mb.txt";
//		FileReader fileReader2 = new FileReader(fileName2);
//
//		BufferedReader bufferedReader2 = new BufferedReader(fileReader2);
//
//		String line2 = "";
//		StringBuilder context2 = new StringBuilder();
//		while (line2 != null) {
//			line2 = bufferedReader2.readLine();
//			if (line2 == null) {
//				break;
//			}
//			context2.append(line2);// .append('\n');
//		}
//		// String plaintext = "" + context;// "12345678900987651234567890098765";
//		
//		
//		String plaintext2 ="" +context2;
//		String pwd = "B5Se20g6b6AX1oml";
//		String salt_key = Pbkdf2Sha256.encode(pwd,"B5Se20g6b6AX1oml");
//		byte [] key = Pbkdf2Sha256.fromHex(salt_key);
//		System.out.println("java库函数五种模式测试：");
//		for(int i=0;i<10;i++) {
//			long t15 = System.currentTimeMillis();
//			Encrypt.Aes256Encode("AES/CFB/PKCS7Padding",plaintext2, key);
//			long t16 = System.currentTimeMillis();
//			System.out.print("CFB模式用时："+(t16-t15)+" ");
//			long t17 = System.currentTimeMillis();
//			Encrypt.Aes256Encode("AES/OFB/PKCS7Padding",plaintext2, key);
//			long t18 = System.currentTimeMillis();
//			System.out.print("OFB模式用时："+(t18-t17)+" ");
//			long t11 = System.currentTimeMillis();
//			Encrypt.Aes256Encode("AES/ECB/PKCS7Padding",plaintext2, key);
//			long t12 = System.currentTimeMillis();
//			System.out.print("ECB模式用时："+(t12-t11)+" ");
//			long t13 = System.currentTimeMillis();
//			Encrypt.Aes256Encode("AES/CBC/PKCS7Padding",plaintext2, key);
//			long t14 = System.currentTimeMillis();
//			System.out.print("CBC模式用时："+(t14-t13)+" ");
//			long t19 = System.currentTimeMillis();
//			Encrypt.Aes256Encode("AES/CTR/PKCS7Padding",plaintext2, key);
//			long t20 = System.currentTimeMillis();
//			System.out.print("CTR模式用时："+(t20-t19)+" ");
//			System.out.println();
//		}

		// System.out.println(context);
		// AES五种加密模式测试
		
		// System.out.println("明文为： " + plaintext);
		// System.out.println("密钥为： " + key);
//		// CTR模式
//		long t5 = System.currentTimeMillis();
		String iv = "abcdefghjdlibieh";
//		CTRModle ctrModle = new CTRModle();
//		ctrModle.CTR(iv, plaintext, key);
//		long t6 = System.currentTimeMillis();
//		System.out.println("CTR模式用时：" + (t6 - t5));
//
//		// CBC模式
//		long t3 = System.currentTimeMillis();
//		CBCModle cbcModle = new CBCModle();
//		cbcModle.CBC(plaintext, key);
//		long t4 = System.currentTimeMillis();
//		System.out.println("CBC模式用时：" + (t4 - t3));
//
//		long t1 = System.currentTimeMillis();
//		ECBModle ecbModle = new ECBModle();
//		ecbModle.ECB(plaintext, key);
//		long t2 = System.currentTimeMillis();
//		System.out.println("ECB模式用时：" + (t2 - t1));
//
//		// CFB模式
//		long t7 = System.currentTimeMillis();
//		CFBModle cfbModle = new CFBModle();
//		cfbModle.CFB(plaintext, key);
//		long t8 = System.currentTimeMillis();
//		System.out.println("CFB模式用时：" + (t8 - t7));
//		// OFB模式
//		long t9 = System.currentTimeMillis();
//		OFBModle ofbModle = new OFBModle();
//		ofbModle.OFB(plaintext, key);
//		long t10 = System.currentTimeMillis();
//		System.out.println("OFB模式用时：" + (t10 - t9));
		String plaintext = "" + context;// "12345678900987651234567890098765";
		// System.out.println(plaintext);
		String key2 = "123456hh90123456";
		System.out.println("实验五种模式用时：");
		for (int i = 0; i < 10; i++) {
			// CFB模式
			long t7 = System.currentTimeMillis();
			CFBModle cfbModle = new CFBModle();
			cfbModle.CFB(plaintext, key2);
			long t8 = System.currentTimeMillis();
			System.out.print("CFB模式用时：" + (t8 - t7) + " ");
			// OFB模式
			long t9 = System.currentTimeMillis();
			OFBModle ofbModle = new OFBModle();
			ofbModle.OFB(plaintext, key2);
			long t10 = System.currentTimeMillis();
			System.out.print("OFB模式用时：" + (t10 - t9) + " ");
			
			// CTR模式
			long t5 = System.currentTimeMillis();
			CTRModle ctrModle = new CTRModle();
			ctrModle.CTR(plaintext, key2);
			long t6 = System.currentTimeMillis();
			System.out.print("CTR模式用时：" + (t6 - t5) + " ");

			// ECB模式
			long t1 = System.currentTimeMillis();
			ECBModle ecbModle = new ECBModle();
			ecbModle.ECB(plaintext, key2);
			long t2 = System.currentTimeMillis();
			System.out.print("ECB模式用时：" + (t2 - t1) + " ");

			// CBC模式
			long t3 = System.currentTimeMillis();
			CBCModle cbcModle = new CBCModle();
			cbcModle.CBC(plaintext, key2);
			long t4 = System.currentTimeMillis();
			System.out.print("CBC模式用时：" + (t4 - t3) + " ");
			System.out.println();
		}
//		// CFB模式
//		long t7 = System.currentTimeMillis();
//		CFBModle cfbModle = new CFBModle();
//		cfbModle.CFB(plaintext, key);
//		long t8 = System.currentTimeMillis();
//		System.out.print("CFB模式用时：" + (t8 - t7) + " ");
//		// OFB模式
//		long t9 = System.currentTimeMillis();
//		OFBModle ofbModle = new OFBModle();
//		ofbModle.OFB(plaintext, key);
//		long t10 = System.currentTimeMillis();
//		System.out.print("OFB模式用时：" + (t10 - t9) + " ");
//
//		// CTR模式
//		long t5 = System.currentTimeMillis();
//		CTRModle ctrModle = new CTRModle();
//		ctrModle.CTR(plaintext, key);
//		long t11 = System.currentTimeMillis();
//		System.out.print("CTR模式用时：" + (t11 - t5) + " ");
//
//		// ECB模式
//		long t1 = System.currentTimeMillis();
//		ECBModle ecbModle = new ECBModle();
//		ecbModle.ECB(plaintext, key);
//		long t2 = System.currentTimeMillis();
//		System.out.print("ECB模式用时：" + (t2 - t1) + " ");
//
//		// CBC模式
//		long t3 = System.currentTimeMillis();
//		CBCModle cbcModle = new CBCModle();
//		cbcModle.CBC(plaintext, key);
//		long t4 = System.currentTimeMillis();
//		System.out.print("CBC模式用时：" + (t4 - t3) + " ");
//		System.out.println();

		System.out.println();
		// System.out.println(16749%16);

//		for (int i = 0; i < 10; i++) {
//			// ECB模式
//			long t1 = System.currentTimeMillis();
//			ECBModle ecbModle = new ECBModle();
//			ecbModle.ECB(plaintext, key);
//			long t2 = System.currentTimeMillis();
//			System.out.println("ECB模式用时：" + (t2 - t1));
//		}
//
//		for (int i = 0; i < 10; i++) {
//			// CBC模式
//			long t3 = System.currentTimeMillis();
//			CBCModle cbcModle = new CBCModle();
//			cbcModle.CBC(plaintext, key);
//			long t4 = System.currentTimeMillis();
//			System.out.println("CBC模式用时：" + (t4 - t3));
//		}
//
//		for (int i = 0; i < 10; i++) {
//			// CFB模式
//			long t7 = System.currentTimeMillis();
//			CFBModle cfbModle = new CFBModle();
//			cfbModle.CFB(plaintext, key);
//			long t8 = System.currentTimeMillis();
//			System.out.println("CFB模式用时：" + (t8 - t7));
//		}
//		for (int i = 0; i < 10; i++) {
//			// OFB模式
//			long t9 = System.currentTimeMillis();
//			OFBModle ofbModle = new OFBModle();
//			ofbModle.OFB(plaintext, key);
//			long t10 = System.currentTimeMillis();
//			System.out.println("OFB模式用时：" + (t10 - t9));
//		}

		System.out.println("---------测试完毕----------");

//		String plaintext = "passwordTextCase", key = "simpleKeyCase123";
//	    CipherService aesService = new AESCipherService();
//	    String encryptedText = aesService.encrypt(plaintext, key);
//	    System.out.println(encryptedText);

	}
}
