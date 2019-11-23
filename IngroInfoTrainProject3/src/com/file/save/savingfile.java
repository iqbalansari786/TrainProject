package com.file.save;

import java.io.File;
import java.io.FileOutputStream;

import org.springframework.web.multipart.MultipartFile;

public class savingfile {
	public void saveServiveProviderImage1Sell(MultipartFile file1) {

		if (!file1.isEmpty()) {
			String filePath = "D:\\imagesForSell";
			File folder = new File(filePath);
			if (!folder.exists()) {
				folder.mkdirs();
			}
			String fileName = file1.getOriginalFilename();
			String[] extension = fileName.split("\\.");
			String getExtension = extension[1];
			if (!("").equals(fileName)) {

				File newFile = new File(filePath, fileName);

				try {
					if (!newFile.exists()) {
						FileOutputStream fos = new FileOutputStream(newFile);
						fos.write(file1.getBytes());
						fos.flush();
						fos.close();
					}
				} catch (Exception e) {
					e.printStackTrace();
				}

				
			}
		}

	}
}
