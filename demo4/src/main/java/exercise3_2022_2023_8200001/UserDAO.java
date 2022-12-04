package exercise3_2022_2023_8200001;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;


/**
 * UserDAO provides all the necessary methods related to users.
 * 
 * @author 
 *
 */
public class UserDAO {
		
	/**
	 * This method returns a List with all Users
	 * 
	 * @return List<User>
	 */
	public List<User> getUsers() throws Exception {
				DB db = new DB();
				List<User> userList = new ArrayList<>();
				try{
					Connection conn = db.getConnection();
					PreparedStatement pst = conn.prepareStatement("SELECT * FROM users_ex3_8200001_2022_2023");
					ResultSet rs = pst.executeQuery();
					while(rs.next()){
						String username = rs.getString(1);
						String firstname = rs.getString(2);
						String lastname = rs.getString(3);
						String email = rs.getString(4);
						String password = rs.getString(5);
						User user = new User(firstname, lastname, email,username, password);
						userList.add(user);
					}
					rs.close();
					pst.close();
					db.close();
				} catch (Exception e) {
					throw new Exception(e.getMessage());
				} finally {
					try {
						db.close();
					} catch (Exception e) {
					}
				}
		// ΘΕΜΑ 1 A
				return userList;
	} //End of getUsers

	/**
	 * Search user by username
	 * 
	 * @param username, String
	 * @return User, the User object or null
	 * @throws Exception
	 */
	public User findUser(String username) throws Exception {
		DB db = new DB();
		User usr = null;
		try {
			Connection conn = db.getConnection();
			PreparedStatement pst = conn.prepareStatement("SELECT * FROM users_ex3_8200001_2022_2023");
			ResultSet rs = pst.executeQuery();
			while (rs.next()){
				String usrname = rs.getString(1);
				String firstname = rs.getString(2);
				String lastname = rs.getString(3);
				String email = rs.getString(4);
				String password = rs.getString(5);
				if(usrname.equals(username)){
					 usr = new User(firstname, lastname, email, username, password);
					 break;
				}
			}
			rs.close();
			pst.close();
			db.close();
		}catch (Exception e) {
			throw new Exception("User not found!");
		} finally {
			try {
				db.close();
			} catch (Exception e) {

			}

		}
		return usr;

		// ΘΕΜΑ 1 B
		
	} //End of findUser

	/**
	 * This method is used to authenticate a user.
	 * 
	 * @param username, String
	 * @param password, String
	 * @return User, the User object
	 * @throws Exception, if the credentials are not valid
	 */
	public User authenticate(String username, String password) throws Exception {
		DB db = new DB();
		User usr = null;
		try {
			Connection conn = db.getConnection();
			PreparedStatement pst = conn.prepareStatement("SELECT * FROM users_ex3_8200001_2022_2023");
			ResultSet rs = pst.executeQuery();
			boolean isRegistered = false;
			while (rs.next()) {
				String usrname = rs.getString(1);
				String firstname = rs.getString(2);
				String lastname = rs.getString(3);
				String email = rs.getString(4);
				String pasword = rs.getString(5);
				if (usrname.equals(username) && pasword.equals(password)) {
					usr = new User(firstname, lastname, email, username, password);
					isRegistered = true;
				}
			}
			if(!isRegistered){
				throw new Exception("Wrong username or password");
			}

			rs.close();
			pst.close();
			db.close();
		}catch (Exception e) {
			throw new Exception(e.getMessage());
		} finally {
			try {
				db.close();
			} catch (Exception e) {

			}

		}
		return usr;

		// ΘΕΜΑ 1 C

	} //End of authenticate
	
	/**
	 * Register/create new User.
	 * 
	 * @param user, User
	 * @throws Exception, if encounter any error.
	 */
	public void register(User user) throws Exception {
		DB db = new DB();

		try {
			Connection conn = db.getConnection();
			PreparedStatement pst = conn.prepareStatement("SELECT username, email FROM users_ex3_8200001_2022_2023");
			ResultSet rs = pst.executeQuery();
			boolean isRegistered = false;
			while (rs.next()) {
				String username = rs.getString(1);
				String email = rs.getString(2);
				if(user.getUsername().equals(username) && user.getEmail().equals(email)){
					isRegistered = true;
					break;
				}

			}
			if (!isRegistered){
				String SQL_INSERT = "INSERT INTO users_ex3_8200001_2022_2023 (username, firstname, lastname, email, password) VALUES (?,?,?,?,?)";
				PreparedStatement pstm = conn.prepareStatement(SQL_INSERT);
				pstm.setString(1, user.getUsername());
				pstm.setString(2, user.getFirstname());
				pstm.setString(3, user.getLastname());
				pstm.setString(4, user.getEmail());
				pstm.setString(5, user.getPassword());
				pstm.executeUpdate();
				pstm.close();
			}else {
				throw new Exception("Sorry, username or email already registered");
			}
			rs.close();
			pst.close();
			db.close();
		} catch (Exception e) {
			throw new Exception(e.getMessage());
		} finally {

			try {
				db.close();
			} catch (Exception e) {

			}

		}
		// ΘΕΜΑ 1 D
	}//end of register

} //End of class
