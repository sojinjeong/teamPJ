package school.dto;

public class IDto {

   private int id;
   private int stNum;
   private String title;
   

   
   public int getId() {
      return id;
   }
   public void setId(int id) {
      this.id = id;
   }
   public int getStNum() {
      return stNum;
   }
   public void setStNum(int stNum) {
      this.stNum = stNum;
   }
   public String getTitle() {
      return title;
   }
   public void setTitle(String title) {
      this.title = title;
   }
   
   @Override
   public String toString() {
      return "IDto [id=" + id + ", stNum=" + stNum + ", title=" + title + "]";
   }
   
   
}