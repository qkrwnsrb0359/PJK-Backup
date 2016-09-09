package edu.kosta.thumb;

import java.awt.Graphics2D;
import java.awt.image.BufferedImage;
import java.io.File;

import javax.imageio.IIOImage;
import javax.imageio.ImageIO;
import javax.media.jai.JAI;
import javax.media.jai.RenderedOp;
import javax.swing.ImageIcon;

public class Thumbnail {
	public static void createImage(String loadFile, String saveFile, int zoom) throws Exception {
		File save = new File(saveFile);
		RenderedOp op = JAI.create("fileload", loadFile); //loadFile은 원본이미지 파일, RenderedOp 객체 생성
		//BufferedImage
		BufferedImage im = op.getAsBufferedImage();
		
		if(zoom <= 0) {
			zoom = 1;
		}
		
		int width = im.getWidth() / zoom;
		int height = im.getHeight() / zoom;
		
		
		// 메모리에 이미지 공간을 생성
		BufferedImage thumb = new BufferedImage(width, height, BufferedImage.TYPE_INT_RGB);
		Graphics2D g2 = thumb.createGraphics();
		
		//실제 그려주는 부분
		g2.drawImage(im, 0, 0, width, height, null);
		ImageIO.write(thumb, "jpg", save); //메모리에 그린 이미지를 파일로 저장	
	}
}
