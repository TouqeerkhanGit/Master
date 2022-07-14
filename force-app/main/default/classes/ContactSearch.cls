public class ContactSearch {
    public static List<contact> searchForContacts(string lastname,string mailingPostalCode){
        List<contact> retlist=[Select Id,Name,LastName,MailingPostalCode from contact
                               where LastName= :lastname AND MailingPostalCode= :mailingPostalCode
                              ];
        
        return retlist;
    }

}