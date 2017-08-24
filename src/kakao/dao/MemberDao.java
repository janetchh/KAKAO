package kakao.dao;

import org.apache.ibatis.session.SqlSessionFactory;

import kakao.bean.MemberBean;
import kakao.util.SqlSessionFactoryManager;

public class MemberDao {
	private SqlSessionFactory sqlSessionFactory;

	public MemberDao() {
		sqlSessionFactory = SqlSessionFactoryManager.getSqlSessionFactory();
	}
	
	public boolean idCheck(String id, String pw)throws Exception{
		String dbpass=sqlSessionFactory.openSession().selectOne("idCheck", id);
		return pw.equals(dbpass)?true:false;
	}
	
	public MemberBean selectMember(String id) throws Exception{
		return sqlSessionFactory.openSession().selectOne("selectMember", id);
	}
}
