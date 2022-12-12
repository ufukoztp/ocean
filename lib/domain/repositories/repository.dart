

abstract class Repository{
  ///homepage
  ///header
  Future getHeaderTitle();
  Future getHeaderBody();
  Future getHeaderImage();
  ///body why create a company? text
  Future getBodyContentTitle1();
  Future getBodyContentBody1();

  ///service card
  Future getServiceCards();

 ///what we offer
 Future getBodyContentTitle2();
 Future getBodyContentItem2();

 Future requestSupport();



///Mentorpage
  Future getHeaderTitleMentor();
  Future getHeaderBodyMentor();
  Future getHeaderImageMentor();


  Future getSssTitle();
  Future getSssItem();




  Future getCostTitle();
  Future getCostCard();


  ///contact
  Future getContactInfoAddress();
  Future getContactInfoMail();
  Future getContactInfoPhone();
  Future getHeaderImageSupport();


  ///get bottom text
  Future getBottomText();


  ///hizmet page
  Future getHizmetCards();


  ///egitim page

  Future getSellCardsPrice();
  Future getSellCardsPriceType();
  Future getSellCardsTitle();
  Future getSellCardsContents();
}