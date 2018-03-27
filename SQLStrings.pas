unit SQLStrings;

interface

const
  sqlGetPubHouses = 'SELECT * FROM PublishingHouse';
  sqlInsertPubHouse = 'INSERT INTO PublishingHouse '
                    + 'VALUES(null, :Name)';
  sqlDeletePubHouse = 'DELETE FROM PublishingHouse '
                    + 'WHERE PubHouse_id = :PubHouse_id';
  sqlEditPubHouse = 'UPDATE PublishingHouse SET Name = :Name '
                  + 'WHERE PubHouse_id = :PubHouse_id';

  sqlGetFriends = 'SELECT * FROM Friend';
  sqlInsertFriend = 'INSERT INTO Friend VALUES(null, :FIO, :PhoneNumber, '
                  + ':SocialNumber, :Email, :Comment)';
  sqlDeleteFriend = 'DELETE FROM Friend WHERE Friend_id = :Friend_id';
  sqlEditFriend = 'UPDATE Friend SET FIO = :FIO, PhoneNumber = :PhoneNumber, '
                + 'SocialNumber = :SocialNumber, Email = :Email, Comment = :Comment '
                + 'WHERE Friend_id = :Friend_id';

  sqlGetBooksWithPubHouseAndGenres = 'SELECT * FROM GetBooksWithPubHouseAndGenres';
  sqlInsertBook = 'INSERT INTO Book(Book_id, Name, Author, PicAuthor, Translator, PubYear, PubHouse_id, Comment) '
                    + 'VALUES(null, :Name, :Author, :PicAuthor, :Translator, :PubYear, :PubHouse_id, :Comment)';
  sqlDeleteBook = 'DELETE FROM Book '
                    + 'WHERE Book_id = :Book_id';
  sqlEditBook = 'UPDATE Book SET Name = :Name, Author = :Author, PicAuthor = :PicAuthor, Translator = :Translator, PubYear = :PubYear, Comment = :Comment, PubHouse_id = :PubHouse_id '
                  + 'WHERE Book_id = :Book_id';

  sqlGetGenres = 'SELECT * FROM Genre';
  sqlInsertGenre = 'INSERT INTO Genre VALUES(null, :Name, :ParentGenre_id)';
  sqlDeleteGenre = 'DELETE FROM Genre WHERE Genre_id = :Genre_id';
  sqlEditGenre = 'UPDATE Genre SET Name = :Name, ParentGenre_id = :ParentGenre_id '
    + 'WHERE Genre_id = :Genre_id';

  sqlGetBorrowings = 'SELECT BK.Name, F.FIO, B.BorrowDate,'
    + 'CASE B.IsLost WHEN True THEN ''+'' WHEN False THEN '''' END AS IsLost, '
    + 'CASE B.IsDamaged WHEN True THEN ''+'' WHEN False THEN '''' END AS IsDamaged, '
    + 'B.ReturnDate, B.Comment '
    + 'FROM Borrowing B JOIN Friend F ON B.Friend_id = F.Friend_id '
    + 'JOIN Book BK ON B.Book_id = BK.Book_id'; 
  sqlInsertBorrowing = 'INSERT INTO Borrowing(Book_id, Friend_id, BorrowDate, IsLost, '
    + 'IsDamaged, ReturnDate, Comment) VALUES(:Book_id, :Friend_id, :BorrowDate, '
    + 'CASE :IsLost WHEN ''False'' THEN False ELSE True END, CASE :IsDamaged WHEN ''False'' THEN False ELSE True END, :ReturnDate, :Comment)';
  sqlDeleteBorrowing = 'DELETE FROM Borrowing WHERE Book_id = :Book_id AND Friend_id = :Friend_id AND Borrowdate = :BorrowDate';
  sqlEditBorrowing = 'UPDATE Borrowing SET IsLost = CASE :IsLost WHEN ''False'' THEN False ELSE True END, IsDamaged = CASE :IsDamaged WHEN ''False'' THEN False ELSE True END, '
    + 'ReturnDate = :ReturnDate, Comment = :Comment '
    + 'WHERE Book_id = :Book_id AND Friend_id = :Friend_id AND BorrowDate = :BorrowDate';

  sqlGetGenresForBook = 'SELECT G.Name FROM BookGenre BG JOIN Genre G ON BG.Genre_id = G.Genre_id WHERE Book_id = :Book_id';
  sqlGetBooksGenres = 'SELECT * FROM BookGenre';
  sqlInsertBookGenre = 'INSERT INTO BookGenre(Book_id, Genre_id) VALUES(:Book_id, :Genre_id)';
  sqlDeleteBookGenre = 'DELETE FROM BookGenre WHERE Book_id = :Book_id AND Genre_id = :Genre_id';
  sqlDeleteGenresForBook = 'DELETE FROM BookGenre WHERE Book_id = :Book_id';

implementation

end.

