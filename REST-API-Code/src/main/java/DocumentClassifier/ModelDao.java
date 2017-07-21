package DocumentClassifier;


import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;

public class ModelDao implements service{

	@Override
	public void save(Model m) {
				SessionFactory s = new Configuration().configure().buildSessionFactory();
				System.out.println("done");
				Session session1 =s.openSession();
				Transaction tr = session1.beginTransaction();
				session1.persist(m);
				System.out.println("done");
				tr.commit();	
	}
		
}
