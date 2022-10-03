package com.project.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import com.project.dto.FileDTO;
import com.project.dto.FileUploadDTO;
import com.project.dto.NoticeDTO;
import com.project.dto.NoticeMainDTO;
import com.project.dto.NoticeReplyDTO;
import com.project.mapper.BoardMapper;

@Service
public class BoardService {
	private BoardMapper boardMapper;

	public BoardService(BoardMapper boardMapper) {
		this.boardMapper = boardMapper;
	}

	public List<NoticeMainDTO> selectNoticeContent(String pageNo) {
		return boardMapper.selectNoticeContent(pageNo);
	}

	public int selectNoticeCount() {
		return boardMapper.selectNoticeCount();
	}

	public String uploadImage(String path, String noticeno) {
		String photono = boardMapper.selectBoardImageNo();
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("path", path);
		map.put("photono", photono);
		map.put("noticeno", noticeno);
		boardMapper.insertBoardImage(map);
		return photono;
	}

	public String selectImageFile(String photono) {
		return boardMapper.selectImageFile(photono);
	}

	public String selectNoticeNo() {
		return boardMapper.selectNoticeNo();
	}

	public int insertNoticeBoard(NoticeDTO dto, String noticeno) {
		dto.setNoticeno(noticeno);
		return boardMapper.insertNoticeBoard(dto);
	}

	public int insertNoticeFileList(FileDTO fileDTO) {
		return boardMapper.insertFileList(fileDTO);
	}

	public NoticeDTO selectNoticeDetail(String noticeno) {
		return boardMapper.selectNoticeDetail(noticeno);
	}

	public void deleteNotUploadImg(int imgNo) {
		boardMapper.deleteNotUploadImg(imgNo);
	}

	public List<Integer> selectAllImgNo(String noticeno) {
		return boardMapper.selectAllImgNo(noticeno);
	}

	public String selectNotUploadFileLoc(int imgNo) {
		return boardMapper.selectNotUploadFileLoc(imgNo);
	}

	public int updateNoticeContent(NoticeDTO notice) {
		return boardMapper.updateNoticeContent(notice);
	}

	public List<NoticeReplyDTO> selectNoticeReply(String noticeno) {
		return boardMapper.selectNoticeReply(noticeno);
	}

	public int insertNoticeReply(NoticeReplyDTO dto) {
		return boardMapper.insertNoticeReply(dto);
	}

	public int insertNoticeReplyRe(NoticeReplyDTO dto) {
		return boardMapper.insertNoticeReplyRe(dto);
	}

	public int deleteNoticeContent(String noticeno) {
		return boardMapper.deleteNoticeContent(noticeno);
	}

	public List<NoticeReplyDTO> selectNoticeRecent3Reply() {
		return boardMapper.selectNoticeRecent3Reply();
	}

	public List<NoticeDTO> selectNoticeRecent3() {
		return boardMapper.selectNoticeRecent3();
	}

	public int deleteNoticeImgLoc(String noticeno) {
		return boardMapper.deleteNoticeImgLoc(noticeno);
	}

	public int deleteCartList(String productno, String id) {
		Map<String,Object> map = new HashMap<String, Object>();
		map.put("productno", productno);
		map.put("id", id);
		return boardMapper.deleteCartList(map);
	}

	public int deleteNoticeReply(String replyno) {
		return boardMapper.deleteNoticeReply(replyno);
	}

	public List<NoticeMainDTO> selectNoticeSearch(String pageNo, String search) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("pageNo", pageNo);
		map.put("search", search);
		return boardMapper.selectNoticeSearch(map);
	}

	public int selectNoticeSearchCount(String search) {
		return boardMapper.selectNoticeSearchCount(search);
	}

	public List<FileUploadDTO> selectFileList(String noticeno) {
		return boardMapper.selectFileList(noticeno);
	}

	public String selectNoFile(String noticeno, int fno) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("noticeno", noticeno);
		map.put("fno", fno);
		return boardMapper.selectNoFile(map);
	}

}
