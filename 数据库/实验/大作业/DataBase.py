import pyodbc

class QQ_Speed:
    def __init__(self):
        self.cursor = None
        self.cnxn = None

    def connect(self):
        self.cnxn = pyodbc.connect('DRIVER={ODBC Driver 17 for SQL Server};Server=172.18.35.96;PORT=1433;DATABASE=QQ_Speed;UID=sa;PWD=zhuzhiru')
        self.cursor = self.cnxn.cursor()

    def create_tables(self):
        self.cursor.execute("""
            create table car(
                car_name varchar(100) primary key,
                car_level varchar(10),
                car_charmingvalue int,
                car_description varchar(7000),
                car_price int
            );""")
        self.cursor.execute("""
            create table map(
                map_name varchar(100) primary key,
                star_level int,
                map_description varchar(7000),
                best_record int
            );""")
        self.cursor.execute("""
            create table pet(
                pet_name varchar(100) primary key,
                pet_charmingvalue int,
                pet_description varchar(7000),
                pet_price int
            );""")
        self.cursor.execute("""
            create table clothes(
                clothes_name varchar(100) primary key,
                clothes_charmingvalue int,
                clothes_price int
            );""")
        self.cursor.execute("""
            create table player(
                name varchar(100) primary key,
                password varchar(100),
                current_experience int,
                current_level int,
                current_charming_level int,
                player_level1 varchar(20),
                player_level2 int, 
                player_level3 int,
                money int
            );""")
        self.cursor.execute("""
            create table fleet(
                fleet_name varchar(100) primary key,
                captain varchar(100) references player(name),
                fleet_level1 varchar(20),
                fleet_level2 int,
                fleet_level3 int
            );""")
        self.cursor.execute("""
            create table cars_of_player(
                player_name varchar(100) references player(name),
                car_name varchar(100) references car(car_name),
                is_driving int,
                primary key(player_name, car_name)
            );""")
        self.cursor.execute("""
            create table pets_of_player(
                player_name varchar(100) references player(name),
                pet_name varchar(100) references pet(pet_name),
                pet_level int,
                pet_experience int,
                is_taking int,
                primary key(player_name, pet_name)
            );""")
        self.cursor.execute("""
            create table maps_of_player(
                player_name varchar(100) references player(name),
                map_name varchar(100) references map(map_name),
                record int,
                primary key(player_name, map_name)
            );""")
        self.cursor.execute("""
            create table clothes_of_player(
                player_name varchar(100) references player(name),
                clothes_name varchar(100) references clothes(clothes_name),
                iswearing int,
                primary key(player_name, clothes_name)
            );""")
        self.cursor.execute("""
            create table fleet_of_player(
                player_name varchar(100) references player(name) primary key,
                fleet_name varchar(100) references fleet(fleet_name),
                contribution int
            );""")
        self.cnxn.commit()

    def create_triggers(self):
        self.cursor.execute("""
            create trigger TRI_Record_Update
            on maps_of_player
            after update
            as
                if (update(record))
                begin
                    declare @new_record int, @current_best_record int, @new_map_name varchar(100);
                    select @new_record = record, @new_map_name = map_name
                    from inserted;
                    select @current_best_record = best_record
                    from map
                    where map_name = @new_map_name;
                    if (@new_record < @current_best_record)
                        update map
                        set best_record = @new_record
                        where map_name = @new_map_name;
                end
            """)
        self.cursor.execute("""
            create trigger TRI_Record_Insert
            on maps_of_player
            after insert
            as
                declare @new_record int, @current_best_record int, @new_map_name varchar(100);
                select @new_record = record, @new_map_name = map_name
                from inserted;
                select @current_best_record = best_record
                from map
                where map_name = @new_map_name;
                if (@new_record < @current_best_record)
                    update map
                    set best_record = @new_record
                    where map_name = @new_map_name;
            """)
        self.cursor.execute("""
            create trigger TRI_Pets_Of_Player_Update
            on pets_of_player
            instead of update
            as
                if (update(pet_experience))
                begin
                    declare @new_player_name varchar(100), @new_pet_level int, @new_pet_name varchar(100), @new_pet_experiece int;
                    select @new_player_name = player_name, @new_pet_level = pet_level, @new_pet_name = pet_name, @new_pet_experiece = pet_experience
                    from inserted;
                    if (@new_pet_experiece < @new_pet_level * 100)
                        update pets_of_player
                        set pet_experience = @new_pet_experiece
                        where player_name = @new_player_name and pet_name = @new_pet_name;
                    
                    while @new_pet_experiece >= @new_pet_level * 100
                    begin
                        if (@new_pet_level < 30)
                            update pets_of_player
                            set pet_level += 1, pet_experience = @new_pet_experiece - @new_pet_level * 1000
                            where player_name = @new_player_name and pet_name = @new_pet_name;
                        else
                            update pets_of_player
                            set pet_experience = 30 * 100
                            where player_name = @new_player_name and pet_name = @new_pet_name;
                        select @new_pet_experiece -= @new_pet_level * 1000, @new_pet_level += 1;
                    end 
                end
                
                if (update(is_taking))
                begin
                    declare @new_n_player_name varchar(100), @ntew_n_pet_name varchar(100), @new_taking int;
                    select @new_n_player_name = player_name, @ntew_n_pet_name = pet_name, @new_taking = is_taking
                    from inserted;
                    update pets_of_player
                    set is_taking = @new_taking
                    where @new_n_player_name = player_name and @ntew_n_pet_name = pet_name;
                end
            """)
        self.cursor.execute("""
            create trigger TRI_Change_Pet_Taking
            on pets_of_player
            after update
            as
                if (update(is_taking))
                begin
                    declare @new_is_taking int, @new_pop_pl_peopayecpr_name varchar(100), @new_pett_name varchar(100);
                    select @new_is_taking = is_taking, @new_pop_pl_peopayecpr_name = player_name, @new_pett_name = pet_name
                    from inserted;
                    if (@new_is_taking = 1)
                        update player
                        set current_charming_level += (select pet_charmingvalue
                                                        from pet
                                                        where pet_name = @new_pett_name)
                        where name = @new_pop_pl_peopayecpr_name;
                    else
                        update player
                        set current_charming_level -= (select pet_charmingvalue
                                                        from pet
                                                        where pet_name = @new_pett_name)
                        where name = @new_pop_pl_peopayecpr_name;
                end
            """)
        self.cursor.execute("""
            create trigger TRI_Pets_Of_Player_Insert
            on pets_of_player
            after insert
            as
                declare @new_plpayer_name varchar(100), @new_pet_nname varchar(100);
                select @new_plpayer_name = player_name, @new_pet_nname = pet_name
                from inserted;
                update player
                set money -= (select pet_price
                                from pet
                                where pet_name = @new_pet_nname)
                where name = @new_plpayer_name;
            """)
        self.cursor.execute("""
            create trigger TRI_Change_Car_Driving
            on cars_of_player
            after update
            as
                if (update(is_driving))
                begin
                    declare @new_is_driving int, @newcp_player_name varchar(100), @new_car_name varchar(100);
                    select @new_is_driving = is_driving, @newcp_player_name = player_name, @new_car_name = car_name
                    from inserted;
                    if (@new_is_driving = 1)
                        update player
                        set current_charming_level += (select car_charmingvalue
                                                        from car
                                                        where car_name = @new_car_name)
                        where name = @newcp_player_name;
                    else
                        update player
                        set current_charming_level -= (select car_charmingvalue
                                                        from car
                                                        where car_name = @new_car_name)
                        where name = @newcp_player_name;
                end
            """)
        self.cursor.execute("""
            create trigger TRI_Cars_Of_Player_Insert
            on cars_of_player
            after insert
            as
                declare @new_player_name_cop varchar(100), @new_car_name varchar(100);
                select @new_player_name_cop = player_name, @new_car_name = car_name
                from inserted;
                update player
                set money -= (select car_price
                                from car
                                where car_name = @new_car_name)
                where name = @new_player_name_cop;
            """)
        self.cursor.execute("""
            create trigger TRI_Change_Clothes_Wearing
            on clothes_of_player
            after update
            as 
                if (update(iswearing))
                begin
                    declare @new_iswearing int, @copnew_player_name varchar(100), @new_clothes_name varchar(100);
                    select @new_iswearing = iswearing, @copnew_player_name = player_name, @new_clothes_name = clothes_name
                    from inserted;
                    if (@new_iswearing = 1)
                        update player
                        set current_charming_level += (select clothes_charmingvalue
                                                        from clothes
                                                        where clothes_name = @new_clothes_name)
                        where name = @copnew_player_name;
                    else
                        update player
                        set current_charming_level -= (select clothes_charmingvalue
                                                        from clothes
                                                        where clothes_name = @new_clothes_name)
                        where name = @copnew_player_name;
                end
            """)
        self.cursor.execute("""
            create trigger TRI_Clothes_Of_Player_Insert
            on clothes_of_player
            after insert
            as
                declare @new_playercop_name varchar(100), @new_clothes_name varchar(100);
                select @new_playercop_name = player_name, @new_clothes_name = clothes_name
                from inserted;
                update player
                set money -= (select clothes_price
                                from clothes
                                where clothes_name = @new_clothes_name)
                where name = @new_playercop_name;
            """)
        self.cursor.execute("""
            create trigger TRI_Player_Update
            on player
            instead of update
            as
                declare @new_name varchar(100);
                if (update(money))
                begin
                    declare @new_money int;
                    select @new_name = name, @new_money = money
                    from inserted;
                    update player
                    set money = @new_money
                    where name = @new_name;
                end
                
                if (update(current_experience))
                begin
                    declare @new_experience int, @new_level int;
                    select @new_experience = current_experience, @new_level = current_level, @new_name = name
                    from inserted;
                    if (@new_experience < @new_level * 1000)
                        update player
                        set current_experience = @new_experience
                        where name = @new_name;
                    while @new_experience >= @new_level * 1000
                    begin
                        update player
                        set current_level += 1, current_experience = @new_experience - @new_level * 1000
                        where name = @new_name;
                        select @new_experience -= @new_level * 1000, @new_level += 1;
                    end
                end
                
                if (update(current_charming_level))
                begin
                    declare @new_charming int;
                    select @new_charming = current_charming_level, @new_name = name
                    from inserted;
                    update player
                    set current_charming_level = @new_charming
                    where name = @new_name;
                end
                
                if (update(player_level3))
                begin
                    declare @new_level3 int, @new_level2 int, @new_level1 varchar(20), @next_level1 varchar(20);
                    select @new_name = name, @new_level3 = player_level3, @new_level2 = player_level2, @new_level1 = player_level1
                    from inserted;
                    if (@new_level3 < 50)
                        update player
                        set player_level3 = @new_level3
                        where name = @new_name;
                    while @new_level3 >= 50
                    begin
                        select @next_level1 = 
                            case @new_level1
                                when '青铜' then '白银'
                                when '白银' then '黄金'
                                when '黄金' then '铂金'
                                when '铂金' then '钻石'
                                when '钻石' then '星耀'
                                else '车神'
                            end
                        if (@new_level2 - 1 < 1)
                            if (@new_level1 != '车神')
                            begin
                                update player
                                set player_level2 = 5, player_level3 = @new_level3 - 50, player_level1 = @next_level1
                                where name = @new_name;
                                select @new_level2 = 5, @new_level1 = @next_level1;
                            end
                            else
                                update player
                                set player_level3 = 50
                                where name = @new_name;
                        else
                        begin
                            update player
                            set player_level2 -= 1, player_level3 = @new_level3 - 50
                            where name = @new_name;
                            select @new_level2 -= 1;
                        end
                        select @new_level3 -= 50;
                    end
                end
            """)
        self.cursor.execute("""
            create trigger TRI_Fleet_Update
            on fleet
            instead of update
            as
                declare @new_level1 varchar(20), @new_captain varchar(100), @next_level1 varchar(20), @new_name varchar(100), @new_level2 int, @new_level3 int;
                select @new_name = fleet_name, @new_captain = captain, @new_level1 = fleet_level1, @new_level2 = fleet_level2, @new_level3 = fleet_level3
                from inserted;
                
                if (update(captain))
                    update fleet
                    set captain = @new_captain
                    where fleet_name = @new_name;
                
                if (update(fleet_level3))
                begin
                    if (@new_level3 < 50)
                        update fleet
                        set fleet_level3 = @new_level3
                        where fleet_name = @new_name;
                    while @new_level3 >= 50
                    begin
                        select @next_level1 = 
                            case @new_level1
                                when '青铜' then '白银'
                                when '白银' then '黄金'
                                when '黄金' then '铂金'
                                when '铂金' then '钻石'
                                when '钻石' then '星耀'
                                else '车神'
                            end
                        if (@new_level2 - 1 < 1)
                            if (@new_level1 != '车神')
                            begin
                                update fleet
                                set fleet_level2 = 5, fleet_level3 = @new_level3 - 50, fleet_level1 = @next_level1
                                where fleet_name = @new_name;
                                select @new_level2 = 5, @new_level1 = @next_level1;
                            end
                            else
                                update fleet
                                set fleet_level3 = 50
                                where fleet_name = @new_name;
                        else
                        begin
                            update fleet
                            set fleet_level2 -= 1, fleet_level3 = @new_level3 - 50
                            where fleet_name = @new_name;
                            select @new_level2 -= 1;
                        end
                        select @new_level3 -= 50;
                    end
                end
            """)
        self.cnxn.commit()

    def set_up(self):
        self.create_tables()
        self.create_triggers()

if __name__ == "__main__":
    DB = QQ_Speed()
    DB.connect()
    DB.set_up()