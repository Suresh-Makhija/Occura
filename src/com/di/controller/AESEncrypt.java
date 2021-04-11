package com.di.controller;

import java.security.Key;
import javax.crypto.Cipher;
import javax.crypto.spec.SecretKeySpec;

import Decoder.BASE64Decoder;
import Decoder.BASE64Encoder;



public class AESEncrypt {

	private static final String ALGORITHM = "AES";
    private static final String KEY = "9jD7AZ91yLp5Nw91"; // Key
   
    public static String encrypt(String value) throws Exception
    {
    	
    
        Key key = generateKey();
        Cipher cipher = Cipher.getInstance(AESEncrypt.ALGORITHM);
        cipher.init(Cipher.ENCRYPT_MODE, key);
        byte [] encryptedByteValue = cipher.doFinal(value.getBytes("utf-8"));
        String encryptedValue64 = new BASE64Encoder().encode(encryptedByteValue);
      
        return encryptedValue64;
               
    }
        
    public static String decrypt(String value) throws Exception
    {
        Key key = generateKey();
        Cipher cipher = Cipher.getInstance(AESEncrypt.ALGORITHM);
        cipher.init(Cipher.DECRYPT_MODE, key);
        byte [] decryptedValue64 = new BASE64Decoder().decodeBuffer(value);
        
        byte [] decryptedByteValue = cipher.doFinal(decryptedValue64);
        
        String decryptedValue = new String(decryptedByteValue,"utf-8");
        return decryptedValue;
                
    }
    
    private static Key generateKey() throws Exception 
    {
        Key key = new SecretKeySpec(AESEncrypt.KEY.getBytes(),AESEncrypt.ALGORITHM);
        return key;
    }
	
}