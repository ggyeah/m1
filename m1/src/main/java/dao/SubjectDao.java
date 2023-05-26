package dao;

import java.sql.*;

import util.DBUtil;

import vo.*;

import java.util.*;

public class SubjectDao {
		//1) 과목목록
		public ArrayList<Subject> selectSubjectListByPage(int beginRow, int rowPerPage) throws Exception {
		ArrayList<Subject> list = new ArrayList<>();
			DBUtil dbUtil = new DBUtil();
			Connection conn = dbUtil.getConnection();
	        PreparedStatement listStmt = conn.prepareStatement("SELECT subject_no,subject_name,subject_time,updatedate,createdate FROM subject LIMIT ?, ?");
	        listStmt.setInt(1, beginRow);
	        listStmt.setInt(2, rowPerPage);
	        
	        ResultSet rs = listStmt.executeQuery();
	        
	        while(rs.next()) {
	        	Subject subject = new Subject();
	        	subject.setSubjectNo(rs.getInt("subject_no"));
	        	subject.setSubjectName(rs.getString("subject_name"));
	        	subject.setSubjectTime(rs.getInt("subject_time"));
	        	subject.setUpdatedate(rs.getString("updatedate"));
	        	subject.setCreatedate(rs.getString("createdate"));
	        	list.add(subject);
	    	}

	        return list;
	    }

	
		
		//2) 과목추가
		public int insertSubject(String subjectName, int subjectTime) throws Exception {
			DBUtil dbUtil = new DBUtil();
			Connection conn = dbUtil.getConnection();
			PreparedStatement insertStmt = conn.prepareStatement("INSERT INTO subject (subject_name,subject_time,updatedate,createdate) VALUES(?,?, NOW(), NOW())");
			insertStmt.setString(1, subjectName);
			insertStmt.setInt(2, subjectTime);
			int row = insertStmt.executeUpdate(); 
			if(row == 1) {  
				System.out.println("지역추가성공");
			} else {
				System.out.println("지역추가실패");
			}	
			return row;
		}
		//3) 과목삭제
		public int delectSubject(int subjectNo) throws Exception {
			int row = 0;
			DBUtil dbUtil = new DBUtil();
			Connection conn = dbUtil.getConnection();
			//preparedStatement
			return row;
		}
	
		//4) 과목수정
		public int updateSubject(Subject subject) throws Exception {
			int row = 0;
			DBUtil dbUtil = new DBUtil();
			Connection conn = dbUtil.getConnection();
			// PreparedStatement
			return row; 
		}
		
		//5) 과목하나 상세
		public Subject selectSubjectOne(int subjectNo) throws Exception {
			Subject subject = null;
			DBUtil dbUtil = new DBUtil();
			Connection conn = dbUtil.getConnection();
			//preparedStatement
			//ResultSet
			return subject;
		}
		
		//6) 과목전체 row
		public int selectSubhectCnt() throws Exception{
			int row = 0;
			DBUtil dbUtil = new DBUtil();
			
			Connection conn = dbUtil.getConnection();
			//preparedStatement
			//ResultSet
			return row;
			
		}
}
