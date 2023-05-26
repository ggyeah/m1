package dao;

import vo.*;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.*;

import util.DBUtil;

public class TeacherDao {
/*
ISSUE : 교과목이 연결되지 않은 강사는 출력되지 않는다 inner join -> outer join
selectTeacherlistByPage ( int beginRow, int rowPerPage)
teacherList.jsp + 화면캡쳐 + 샘플데이터 추가

SELECT t.teacher_no, t.teacher_id, t.teacher_name, 
		ts.subject_no,nvl(GROUP_CONCAT(s.subject_name), 'x')
FROM teacher t  LEFT JOIN teacher_subject ts 
	ON t.teacher_no = ts.teacher_no 
		LEFT JOIN subject s 
			ON ts.subject_no = s.subject_no
GROUP BY t.teacher_no, t.teacher_id, t.teacher_name 
LIMIT 0, 10 
*/

	//강사리스트 출력
	public ArrayList<HashMap<String, Object>> selectTeacherListByPage(int beginRow, int rowPerPage) throws Exception {
		ArrayList<HashMap<String, Object>> teacherList = new ArrayList<HashMap<String, Object>>();
		DBUtil dbUtil = new DBUtil();
		Connection conn = dbUtil.getConnection();
	    PreparedStatement listStmt = conn.prepareStatement("SELECT t.teacher_no, t.teacher_id, t.teacher_name, ts.subject_no, nvl(GROUP_CONCAT(s.subject_name), 'x') FROM teacher t LEFT JOIN teacher_subject ts ON t.teacher_no = ts.teacher_no LEFT JOIN subject s on ts.subject_no = s.subject_no GROUP BY t.teacher_no, t.teacher_id, t.teacher_name LIMIT ?, ?");
	    listStmt.setInt(1, beginRow);
	    listStmt.setInt(2, rowPerPage);
		
	    ResultSet rs = listStmt.executeQuery();
	    
	    while (rs.next()) {
	        HashMap<String, Object> t = new HashMap<>();
	        t.put("teacher_no", rs.getString("teacher_no"));
	        t.put("teacher_id", rs.getString("teacher_id"));
	        t.put("teacher_name", rs.getString("teacher_name"));
	        t.put("subject_no", rs.getString("subject_no"));
	        t.put("subject_names", rs.getString("nvl(GROUP_CONCAT(s.subject_name), 'x')"));
	        teacherList.add(t);
	    }
		return teacherList;
		}

	// 페이징을 위한 totalrow
	public int selectTeacherCnt () throws Exception {
		int totalrow = 0;
		
		DBUtil dbUtil = new DBUtil();
		Connection conn = dbUtil.getConnection();
		
		String sql = "SELECT COUNT(*) FROM teacher";
		PreparedStatement stmt = conn.prepareStatement(sql);
		ResultSet totalrowrs = stmt.executeQuery();
		
		if(totalrowrs.next()) {
			totalrow = totalrowrs.getInt("COUNT(*)");
		}
		return totalrow;
		}
	

	//강사 1명 상세보기
	public Teacher  selectTeacherOne(int teacherNo) throws Exception {
		DBUtil dbUtil = new DBUtil();
		Connection conn = dbUtil.getConnection();
	    PreparedStatement teacherOneStmt = conn.prepareStatement("select teacher_no, teacher_id, teacher_name, teacher_history, createdate, updatedate from teacher where teacher_no = ?");
	    teacherOneStmt.setInt(1, teacherNo);
	    
	    ResultSet teacherOneRs = teacherOneStmt.executeQuery();
	    
	    Teacher teacher = null;
	    
	    if(teacherOneRs.next()) {
	     teacher = new Teacher();
    	 teacher.setTeacherNo(teacherOneRs.getInt("teacher_no"));
    	 teacher.setTeacherId(teacherOneRs.getString("teacher_id"));
    	 teacher.setTeacherName(teacherOneRs.getString("teacher_name"));
    	 teacher.setTeacherHistory(teacherOneRs.getString("teacher_history"));
    	 teacher.setCreatedate(teacherOneRs.getString("createdate"));
    	 teacher.setUpdatedate(teacherOneRs.getString("updatedate"));
		}
	    
	    return teacher;
	
	}
	//수정액션 
	public int updateTeacher(Teacher teacher) throws Exception {
		DBUtil dbUtil = new DBUtil();
		Connection conn = dbUtil.getConnection();
		
	    PreparedStatement updateStmt = conn.prepareStatement("UPDATE teacher SET teacher_id = ?,teacher_name = ?,teacher_history = ?, updatedate = now() WHERE teacher_no = ?");
	    updateStmt.setString(1, teacher.getTeacherId());
	    updateStmt.setString(2, teacher.getTeacherName());
	    updateStmt.setString(3, teacher.getTeacherHistory());
	    updateStmt.setInt(4, teacher.getTeacherNo());
		
		//영향받은 행값
		int row = updateStmt.executeUpdate();
			
		if(row == 1) {
			System.out.println(row + " <- 수정성공");
		} else {
			System.out.println(row + " <- 수정실패");
			}
		return row;
	
	}
	
	//삭제 
	public int deleteTeacher(int teacherNo) throws Exception {
		DBUtil dbUtil = new DBUtil();
		Connection conn = dbUtil.getConnection();
	    PreparedStatement deleteStmt = conn.prepareStatement("DELETE FROM teacher WHERE teacher_no = ?");
	    deleteStmt.setInt(1, teacherNo);
	    
	    int row = deleteStmt.executeUpdate();
		
		if (row == 1){
			System.out.println(row + " <- 강사 삭제성공");
		} else {
			System.out.println(row + " <- 강사 삭제실패");
		}
		return row;
	}
	// 강사추가
	public int insertTeacher(Teacher teacher) throws Exception {
		DBUtil dbUtil = new DBUtil();
		Connection conn = dbUtil.getConnection();
		PreparedStatement insertStmt = conn.prepareStatement("INSERT INTO teacher (teacher_id, teacher_name, teacher_history, updatedate, createdate) VALUES(?,?,?, NOW(), NOW())");
	    insertStmt.setString(1, teacher.getTeacherId());
	    insertStmt.setString(2, teacher.getTeacherName());
	    insertStmt.setString(3, teacher.getTeacherHistory());
		int row = insertStmt.executeUpdate(); 
		if(row == 1) {  
			System.out.println("지역추가성공");
		} else {
			System.out.println("지역추가실패");
		}	
		return row;
	}
	
	
	
	
	
	
}
	
	
	
	
	
	
	
	
	
	
