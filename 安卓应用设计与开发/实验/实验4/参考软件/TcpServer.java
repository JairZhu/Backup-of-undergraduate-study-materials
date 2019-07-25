import java.net.*;
import java.io.*;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Calendar;

public class TcpServer {

  public static void main(String[] args) {

     Socket sockets[] = new Socket[20];
     for(int i=0; i<20;i++){
         sockets[i]=null;
     }
     System.out.println("Server start successfully!");
     try{
        ServerSocket serverSocket = new ServerSocket(50000);
        while(true){
          Socket socket = serverSocket.accept();
          System.out.println("建立连接！");
          int i;
          for(i=0; i<20;i++){ 
              if(sockets[i]==null){
                 sockets[i]=socket;
                 break;
              }
          }
          if(i<20){
            Runnable echo= new EchoToAll(sockets,i);
            Thread thread = new Thread(echo);
            thread.start();
          }
        }
     }
     catch(IOException ex){
	System.err.println(ex);
     }
  }
}

class EchoToAll implements Runnable {
  private int ind;
  String user;
  private Socket sockets[];
  private DataInputStream inputFromClient;

  public EchoToAll(Socket sockets1[],int ind1) {
    ind = ind1;
    sockets= sockets1;
    try{
        inputFromClient = new DataInputStream(sockets[ind].getInputStream());
       
    }
    catch(IOException ex){
	System.err.println(ex+"---QQQ!");
     }
  }

  public void run() {
      try{
          while (true){
            String packet = inputFromClient.readUTF();
            System.out.println("数据："+packet);
            sendToAll(packet);

          }
     }
     catch(IOException ex){
        sockets[ind]=null;
        System.out.println("结束连接！");
     }
  }

  private void sendToAll(String echo){
      //System.out.println(echo);

      for(int i=0;i<20;i++){
          if(sockets[i]!=null){
            try{
               DataOutputStream  outputToClient = new DataOutputStream(sockets[i].getOutputStream());
               outputToClient.writeUTF(echo);
            }
            catch(IOException ex){
              sockets[i]=null;
            }
            
         }
      }
  } 

}