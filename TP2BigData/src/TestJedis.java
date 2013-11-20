import java.util.HashMap;
import java.util.Set;
import redis.clients.jedis.Jedis;
public class TestJedis {
    public static final int UNE_SEMAINE = 60*60*24*7;
    public static final void main(String[] args) throws Exception{
     Jedis conn = new Jedis("localhost");
     /*conn.set("cle","valeur");
     String val = conn.get("cle");
     System.out.println(val);*/
     System.out.println("Ajout de l'article 1 par l'utilisateur 1");
     ajoutArticle(conn,"1", "article interessant","url.com");
     Thread.sleep(1000);

     System.out.println("Ajout de l'article 2 par l'utilisateur 2");
     ajoutArticle(conn,"2", "article pas trop interessant","url2.com");
     Thread.sleep(1000);

     System.out.println("Ajout de l'article 3 par l'utilisateur 3");
     ajoutArticle(conn,"3", "article 3","url3.com");
     Thread.sleep(1000);

     System.out.println("Ajout de l'article 4 par l'utilisateur 4");
     ajoutArticle(conn,"4", "article 4","url4.com");
     Thread.sleep(1000);

     System.out.println("Ajout de l'article 5 par l'utilisateur 5");
     ajoutArticle(conn,"5", "article 5","url5.com");
     Thread.sleep(1000);

     System.out.println("Ajout de l'article 6 par l'utilisateur 2");
     ajoutArticle(conn,"2", "article 6","url6.com");
     Thread.sleep(1000);

     System.out.println("Ajout de l'article 7 par l'utilisateur 1");
     ajoutArticle(conn,"1", "article interessant","url.com");
     Thread.sleep(1000);

     System.out.println("Ajout de l'article 8 par l'utilisateur 2");
     ajoutArticle(conn,"2", "article pas trop interessant","url2.com");
     Thread.sleep(1000);

     System.out.println("Ajout de l'article 9 par l'utilisateur 3");
     ajoutArticle(conn,"3", "article 3","url3.com");
     Thread.sleep(1000);

     System.out.println("Ajout de l'article 10 par l'utilisateur 4");
     ajoutArticle(conn,"4", "article 4","url4.com");
     Thread.sleep(1000);

     System.out.println("Ajout de l'article 11 par l'utilisateur 5");
     ajoutArticle(conn,"5", "article 5","url5.com");
     Thread.sleep(1000);

     System.out.println("Ajout de l'article 12 par l'utilisateur 2");
     ajoutArticle(conn,"2", "article 6","url6.com");
     Thread.sleep(1000);

     System.out.println("On affiche tous les articles :");
     afficheTousLesArticles(conn);
     Thread.sleep(1000);

     System.out.println("On affiche les dix derniers articles par ordres chronologique");
     afficheDixDerniersArticles(conn);
     Thread.sleep(1000);

     System.out.println("On place l'article numero 1 dans la categorie Java");
     categoriserArticle(conn, "1", "Java");
     Thread.sleep(1000);
     
     System.out.println("On place l'article numero 1 dans la categorie Scala");
     decategoriserArticle(conn, "1", "Java");
     categoriserArticle(conn, "1", "Scala");
     Thread.sleep(1000);

     System.out.println("On affiche tous les articles du Groupe Java :");
     afficheTousLesArticlesDunGroupe(conn, "Java");
     Thread.sleep(1000);

     System.out.println("On place l'article numero 2 dans la categorie Scala");
     categoriserArticle(conn, "2", "Scala");

     System.out.println("On place l'article numero 3 dans la categorie Scala");
     categoriserArticle(conn, "3", "Scala");

     System.out.println("On place l'article numero 4 dans la categorie Scala");
     categoriserArticle(conn, "4", "Scala");
     
     System.out.println("On affiche tous les articles du Groupe Scala :");
     afficheTousLesArticlesDunGroupe(conn, "Scala");
     Thread.sleep(1000);

     System.out.println("On place l'article numero 9 dans la categorie Groovy");
     categoriserArticle(conn, "9", "Groovy");

     System.out.println("On affiche tous les articles du Groupe Groovy :");
     afficheTousLesArticlesDunGroupe(conn, "Groovy");
     Thread.sleep(1000);
     
     System.out.println("On fait voter les utilisateurs : ");

     System.out.println("On fait voter l'article 1 par les utilisateurs 12, 3, 2, 11, 21, 23");
     vote(conn,"12","1");
     vote(conn,"3","1");
     vote(conn,"2","1");
     vote(conn,"11","1");
     vote(conn,"21","1");
     vote(conn,"23","1");
     Thread.sleep(1000);

     System.out.println("On fait voter l'article 3 deux fois par l'utiliateur 2");
     vote(conn,"2","3");
     vote(conn,"2","3");
     Thread.sleep(1000);


     System.out.println("On affiche les dix meilleurs articles : ");
     afficheDixMeilleursArticles(conn);
     Thread.sleep(1000);

     System.out.println("On affiche les dix meilleurs articles du groupe Scala : ");
     afficheDixMeilleursArticlesDunGroupe(conn, "Scala");

     conn.flushAll();
    }

    public static String vote(Jedis conn, String utilisateur, String articleId){
        String article = "article:"+articleId;
        //Si l'utilisateur n'a pas deja vote pour cet article
        if(!conn.smembers("selectionne:"+articleId).contains("user:"+utilisateur)){
        //on augmente le nombre de vote
        conn.hincrBy(article, "nbvotes", 1);
        //on augmente le score de l'article
        conn.zincrby("score", 432, article);

        //on recupere toutes les categories
        Set<String> keys = conn.keys("categorie:*");
        for(String key : keys){
            String libelleGroupe = key.substring(10, key.length());
            //On cherche la categorie de l'article et on augmente son score au sein de la categorie
            if(conn.smembers(key).contains(article)){
                conn.zincrby("score:"+libelleGroupe, 432, article);
                break;
            }
        }
            //on ajoute l'utilisateur a la liste des votants
            conn.sadd("selectionne:"+articleId, "user:"+utilisateur);
        }
        else{
            //Si l'utilisateur a deja vote on le notifie
            System.out.println("L'utilisateur "+utilisateur+" ne peut pas voter deux fois sur "+article);
        }

        return articleId;
    }
    
    public static String ajoutArticle(Jedis conn, String utilisateur, String titre, String url) {
           String articleId = String.valueOf(conn.incr("article:"));
           String articleSelectionne = "selectionne:" + articleId;
           conn.sadd(articleSelectionne, "user:"+utilisateur);
           conn.expire(articleSelectionne, UNE_SEMAINE);
           long now = System.currentTimeMillis() / 1000;
           String article = "article:" + articleId;
           HashMap<String,String> donnees = new HashMap<String,String>();
           donnees.put("titre", titre);
           donnees.put("lien", url);
           donnees.put("utilisateur", utilisateur);
           donnees.put("timestamp", String.valueOf(now));
           donnees.put("nbvotes", "1");
           conn.hmset(article, donnees);
           ajoutArticleTimeline(conn,now,article);
           ajoutArticleScore(conn,now,article);
           return articleId;
   }

    public static void categoriserArticle(Jedis conn, String articleId, String groupe){
        String article = "article:"+articleId;
        conn.sadd("categorie:"+groupe,article);
        conn.zadd("score:"+groupe,conn.zscore("score", article),article);
    }

    public static void decategoriserArticle(Jedis conn, String articleId, String groupe){
        String article = "article:"+articleId;
        conn.srem("categorie:"+groupe,article);
        conn.zrem("score:"+groupe, article);
    }

    public static void ajoutArticleTimeline(Jedis conn,long now, String article){
        conn.zadd("timeline",now, article);
    }

    public static void ajoutArticleScore(Jedis conn,long now, String article){
        conn.zadd("score",now+432, article);
    }

    public static void afficheTousLesArticles(Jedis conn){
        Set<String> keys = conn.keys("article:?*");
        for(String key : keys){
            System.out.println(key);
            System.out.println(conn.hgetAll(key));
        }
    }

    public static void afficheDixDerniersArticles(Jedis conn){
        System.out.println(conn.zrevrange("timeline",0,9));
    }

    public static void afficheDixMeilleursArticles(Jedis conn){
        System.out.println(conn.zrevrange("score", 0, 9));
    }

    public static void afficheTousLesArticlesDunGroupe(Jedis conn, String groupe){
        System.out.println(conn.smembers("categorie:"+groupe));
    }

    public static void afficheDixMeilleursArticlesDunGroupe(Jedis conn, String groupe){
        System.out.println(conn.zrevrange("score:"+groupe, 0, 9));
    }
}