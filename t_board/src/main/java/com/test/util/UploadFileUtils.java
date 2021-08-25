package com.test.util;

import java.awt.image.BufferedImage;
import java.io.File;
import java.text.DecimalFormat;
import java.util.Calendar;
import java.util.UUID;

import javax.imageio.ImageIO;

import org.imgscalr.Scalr;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.MediaType;
import org.springframework.util.FileCopyUtils;

public class UploadFileUtils {
	
	private static final Logger logger =  LoggerFactory.getLogger(UploadFileUtils.class);
	
	public static String uploadFile(String uploadPath, String originalName, byte[] fileData) throws Exception {
		// 파일 이름이 중복되는 것을 방지하기 위해 UUID 키 값 생성
		UUID uid = UUID.randomUUID();
		
		// 실제로 저장할 파일명 = UUID + _ + 원본파일
		String savedName = uid.toString() + "_" + originalName;
		
		// 날짜 경로 = 년 + 월 + 일
		String savedPath = calcPath(uploadPath);
		
		// 파일 객체 생성 = 기본 저장 경로 + 날짜 경로 + UUID_파일명
		File target = new File(uploadPath +savedPath, savedName);
		
		// fileData를 파일 객체에 복사
		FileCopyUtils.copy(fileData,  target);
		
		// 파일 확장자 추출
		String formatName = originalName.substring(originalName.lastIndexOf(".")+1);
		
		// 업로드 파일명 : 썸네일 이미지 파일명 or 일반 파일명
		String uploadedFileName = null;
		
		// 확장자에 따라 썸네일 이미지 생성 or 일반 파일 아이콘 생성
		if(MediaUtils.getMediaType(formatName) != null) {
			// 썸네일 이미지 생성, 썸네일 이미지 파일명
			uploadedFileName = makeThumbnail(uploadPath, savedPath, savedName);
		} else {
			// 파일 아이콘 생성
			uploadedFileName = makeIcon(uploadPath, savedPath, savedName);
		}
		
		// 업로드 파일명 반환
		return uploadedFileName;
	}
	
	// 아이콘 생성
	private static String makeIcon(String uploadPath, String path, String fileName) throws Exception {
		
		String iconName = uploadPath + path + File.separator + fileName;
		
		return iconName.substring(uploadPath.length()).replace(File.separatorChar, '/');
	}
	
	
	// 날짜별 경로 추출
	private static String calcPath(String uploadPath) {
		
		Calendar cal = Calendar.getInstance();
		
		String yearPath = File.separator + cal.get(Calendar.YEAR);
		
		String monthPath = yearPath + File.separator + new DecimalFormat("00").format(cal.get(Calendar.MONTH)+1);
		
		String datePath = monthPath + File.separator + new DecimalFormat("00").format(cal.get(Calendar.DATE));
		
		makeDir(uploadPath, yearPath, monthPath, datePath);
		
		logger.info(datePath);
		
		return datePath;
	}//calcPath
	
	// 파일 저장 기본 경로 + 날짜 경로 생성
	private static void makeDir(String uploadPath, String... paths) {
		
		if(new File(uploadPath + paths[paths.length -1]).exists()) {
			return;
		}
		
		// 날짜 경로가 존재하지 않으면 경로 생성을 위한 반복문 수행
		for (String path : paths) {
			
			// 기본 경로 + 날짜 경로에 해당하는 파일 객체 생성
			File dirPath = new File(uploadPath + path);
			
			// 파일 객체에 해당하는 경로가 존재하지 않으면
			if(!dirPath.exists()) {
				// 경로 생성
				dirPath.mkdir();
			}
		}
	}
	
	// 썸네일 생성 : 이미지 파일
	private static String makeThumbnail(String uploadPath, String path, String fileName) throws Exception {
		
		BufferedImage sourceImg = ImageIO.read(new File(uploadPath + path, fileName));
		
		BufferedImage destImg = Scalr.resize(sourceImg, Scalr.Method.AUTOMATIC, Scalr.Mode.FIT_TO_HEIGHT, 100);
		
		String thumbnailName = uploadPath + path + File.separator + "s_" + fileName;
		
		File newFile = new File(thumbnailName);
		String formatName = fileName.substring(fileName.lastIndexOf(".")+1);
		
		ImageIO.write(destImg, formatName.toUpperCase(), newFile);

		return thumbnailName.substring(uploadPath.length()).replace(File.separatorChar, '/');
	}
	
	// 파일 삭제
	public static void removeFile(String uploadPath, String fileName) {
		String formatName = fileName.substring(fileName.lastIndexOf(".") + 1);
		
		MediaType mediaType = MediaUtils.getMediaType(formatName);
		
		if(mediaType != null) {
			String front = fileName.substring(0, 12);
			
			String end = fileName.substring(14);
			
			new File(uploadPath + (front + end).replace('/', File.separatorChar)).delete();
		}
		
		new File(uploadPath + fileName.replace('/',  File.separatorChar)).delete();
	}
}
