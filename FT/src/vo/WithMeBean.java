package vo;

import java.sql.Date;

public class WithMeBean {
	
	int num,people;
	String title,lim,photo,pic1,pic2,pic3,pic4,writer,localcontent,contents;
	public String getLim() {
		return lim;
	}
	public void setLim(String lim) {
		this.lim = lim;
	}
	public String getPic1() {
		return pic1;
	}
	public void setPic1(String pic1) {
		this.pic1 = pic1;
	}
	public String getPic2() {
		return pic2;
	}
	public void setPic2(String pic2) {
		this.pic2 = pic2;
	}
	public String getPic3() {
		return pic3;
	}
	public void setPic3(String pic3) {
		this.pic3 = pic3;
	}
	public String getPic4() {
		return pic4;
	}
	public void setPic4(String pic4) {
		this.pic4 = pic4;
	}
	
	Date date,writedate,limitdate;
	
	public Date getLimitdate() {
		return limitdate;
	}
	public void setLimitdate(Date limitdate) {
		this.limitdate = limitdate;
	}
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public int getPeople() {
		return people;
	}
	public void setPeople(int people) {
		this.people = people;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getPhoto() {
		return photo;
	}
	public void setPhoto(String photo) {
		this.photo = photo;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public String getLocalcontent() {
		return localcontent;
	}
	public void setLocalcontent(String localcontent) {
		this.localcontent = localcontent;
	}
	public String getContents() {
		return contents;
	}
	public void setContents(String contents) {
		this.contents = contents;
	}
	public Date getDate() {
		return date;
	}
	public void setDate(Date date) {
		this.date = date;
	}
	public Date getWritedate() {
		return writedate;
	}
	public void setWritedate(Date writedate) {
		this.writedate = writedate;
	}
	
}