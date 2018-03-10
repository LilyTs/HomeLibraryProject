unit SQLStrings;

interface

const
  sqlGetPubHouses = 'SELECT * FROM PublishingHouse';
  sqlInsertPubHouse = 'INSERT INTO PublishingHouse '
                    + 'VALUES(:PubHouse_id, :Name)';
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

implementation

end.
