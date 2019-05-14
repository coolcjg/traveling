package com.cjg.task;

import java.io.File;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.stream.Collectors;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import com.cjg.domain.BoardAttachVO;
import com.cjg.mapper.BoardAttachMapper;

import lombok.Setter;
import lombok.extern.log4j.Log4j;


@Log4j
@Component
public class FileCheckTask {
	
	@Setter(onMethod_= {@Autowired})
	private BoardAttachMapper attachMapper;
	
	
	private String getFolderYesterDay() {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		
		Calendar cal = Calendar.getInstance();
		
		cal.add(Calendar.DATE, -1);
		
		String str = sdf.format(cal.getTime());
		
		return str.replace("-", File.separator);
	}
	
	
	
	@Scheduled(cron="0 0 22 * * *")
	public void checkFiles() throws Exception{
		log.warn("File Check Task run......................");
		log.warn(new Date());
		//file list in database
		List<BoardAttachVO> fileList = attachMapper.getOldFiles();
		
		//ready for check file in directory with database file list
		List<Path> fileListPaths = fileList.stream()
											.map(vo->Paths.get("C:\\upload", vo.getUploadPath(), vo.getUuid()+"_"+vo.getFileName()))
											.collect(Collectors.toList());
		
		//만약 이미지 파일이라면 위의 fileListPaths에 썸네일 까지 추가.
		fileList.parallelStream().filter(vo->vo.isFileType() == true)
									.map(vo->Paths.get("C:\\upload", vo.getUploadPath(), "s_"+vo.getUuid()+"_"+vo.getFileName()))
									.forEach(p->fileListPaths.add(p));
		
		log.warn("===========================================");
		
		fileListPaths.forEach(p->log.warn(p));
		
		//어제 날짜의 폴더
		File targetDir = Paths.get("C:\\upload", getFolderYesterDay()).toFile();
		
		//어제 날짜의 폴더에 있는 파일들을 fileListPaths리스트랑 비교해 없는 파일을 removeFiles배열에 넣는다.
		File[] removeFiles = targetDir.listFiles(file-> fileListPaths.contains(file.toPath())==false);
		
		log.warn("--------------------------------------------");
		//removeFiles배열에 있는 것들을 삭제.
		if(removeFiles ==null || removeFiles.length == 0)
		{
			log.warn("removeFiles = empty");
		}else {
			for(File file : removeFiles) {
				log.warn(file.getAbsolutePath());
				file.delete();
			}
		}
	}
}
