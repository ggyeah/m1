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
		public int deleteSubject(int subjectNo) throws Exception {
			DBUtil dbUtil = new DBUtil();
			Connection conn = dbUtil.getConnection();
			
			PreparedStatement deleteStmt = conn.prepareStatement("DELETE FROM subject WHERE subject_no = ?");
		    deleteStmt.setInt(1, subjectNo);
		    
		    int row = deleteStmt.executeUpdate();
		    
		    if (row == 1){
				System.out.println(row + " <- 강사 삭제성공");
			} else {
				System.out.println(row + " <- 강사 삭제실패");
			}
			return row;
		}
	
		//4) 과목수정
		public int updateSubject(Subject subject) throws Exception {
			DBUtil dbUtil = new DBUtil();
			Connection conn = dbUtil.getConnection();
			
			PreparedStatement updateStmt = conn.prepareStatement("UPDATE subject SET subject_name = ?, subject_time = ?, updatedate = now() WHERE subject_no = ?");
			    updateStmt.setString(1, subject.getSubjectName());
			    updateStmt.setInt(2, subject.getSubjectTime());
			    updateStmt.setInt(3, subject.getSubjectNo());
				
				//영향받은 행값
				int row = updateStmt.executeUpdate();
					
				if(row == 1) {
					System.out.println(row + " <- 수정성공");
				} else {
					System.out.println(row + " <- 수정실패");
					}
				return row;
			
			}
		
		//5) 과목하나 상세
		public Subject selectSubjectOne(int subjectNo) throws Exception {
			DBUtil dbUtil = new DBUtil();
			Connection conn = dbUtil.getConnection();
			PreparedStatement subjectrOneStmt = conn.prepareStatement("select subject_no, subject_name, subject_time, updatedate, createdate  from subject where subject_no = ?");
			subjectrOneStmt.setInt(1, subjectNo);
		    
		    ResultSet subjectrOneRs = subjectrOneStmt.executeQuery();
		    
		    Subject subject = null;
		    
		    if(subjectrOneRs.next()) {
		    subject = new Subject();
		    subject.setSubjectNo(subjectrOneRs.getInt("subject_no"));
		    subject.setSubjectName(subjectrOneRs.getString("subject_name"));
		    subject.setSubjectTime(subjectrOneRs.getInt("subject_time"));
	    	 subject.setCreatedate(subjectrOneRs.getString("createdate"));
	    	 subject.setUpdatedate(subjectrOneRs.getString("updatedate"));
			}
		
			return subject;
		}
		
		//6) 과목전체 row
		public int selectSubhectCnt() throws Exception{
			int totalrow = 0;
			DBUtil dbUtil = new DBUtil();
			
			Connection conn = dbUtil.getConnection();
			String totalrowsql = "SELECT COUNT(*) FROM subject";
			PreparedStatement totalrowstmt = conn.prepareStatement(totalrowsql);
			ResultSet totalrowrs = totalrowstmt.executeQuery();
			
			if(totalrowrs.next()) {
				totalrow = totalrowrs.getInt("COUNT(*)");
			}
			return totalrow;
			}
			
		}
