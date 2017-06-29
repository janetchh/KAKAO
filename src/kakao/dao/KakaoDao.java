package kakao.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSessionFactory;

import kakao.bean.KakaoBean;
import kakao.util.SqlSessionFactoryManager;

public class KakaoDao {
	private SqlSessionFactory sqlSessionFactory;
	
	public KakaoDao(){
		sqlSessionFactory=SqlSessionFactoryManager.getSqlSessionFactory();
	}
	
	public List<KakaoBean> selectProduct() throws Exception{
		return sqlSessionFactory.openSession().selectList("selectProduct");
	}

}