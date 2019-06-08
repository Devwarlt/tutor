public partial class Player {
    private IEnumerable<ObjectDef> GetNewStaticsV1 () {
        if (Sight == null)
            return default;

        var currentCircle = Sight.GetSightCircle (0).Distinct ().ToList ();

        foreach (var elem in currentCircle) {
            if (ClientTiles == null || _map == null)
                continue;

            if (ClientTiles[elem.X, elem.Y] != _map[elem.X, elem.Y].UpdateCount)
                continue;

            if (_clientStatics.Contains (elem) || this.DistPos (new WorldPosition { X = elem.X, Y = elem.Y }) > _sightRadius)
                continue;

            var (x, y) = (elem.X, elem.Y);

            if (x >= _mW || x < 0 || y >= _mH || y < 0)
                continue;

            var tile = _map[x, y];

            if (tile.ObjectType == 0 || !_clientStatics.Add (new IntPoint (x, y)))
                continue;

            var tileDef = tile.ToDefinition (x, y);

            var oClass = Program.GameData.ObjectDescs[tile.ObjectType].Class.ToString ();

            if (oClass == "ConnectedWall" || oClass == "CaveWall") {
                var hasConnStatData = false;
                foreach (var STAT in tileDef.ObjStats.Stats)
                    if (STAT.Key == StatsType.ObjectConnection && STAT.Value != null)
                        hasConnStatData = true;

                if (!hasConnStatData) {
                    var stats = _tileDef.ObjStats.Stats.ToList ();
                    stats.Add (new KeyValuePair<StatsType, object> (StatsType.ObjectConnection, (int) ConnectionComputer.Compute ((xx, yy) => Owner?.GameMap[x + xx, y + yy].ObjectType == tile.ObjectType).Bits));
                    tileDef.ObjStats.Stats = stats.ToArray ();
                    stats.Clear ();
                }
            }
        }

        private IEnumerable<ObjectDef> GetNewStaticsV2 () {
            var result = new HashSet<ObjectDef> ();
            try {
                var blockSight = Sight.GetSighCircle (0).Distinct ().ToList ();
                blockSight.Where (_ => {
                    var (x, y, tile) = (_.X, _.Y, _map[_.X, _.Y]);
                    return !(x < 0 || x >= _mW || y < 0 || y >= _mH || tile.ObjectType == 0 || !_clientStatics.Add (new IntPoint (x, y)));
                }).Select (_ => {
                    var (x, y, tile, tileDef, cls) = (_.X, _.Y, _map[_.X, _.Y], _map[_.X, _.Y].ToDefinition (_.X, _.Y), Program.GameData.ObjectDescs[_map[_.X, _.Y]].Class.ToString ());

                    if (cls == "ConnectedWall" || cls == "CaveWall")
                        if (tileDef.ObjStats.Stats.Count (__ => __.Key == StatsType.ObjectConnection && __.Value != null) == 0)
                            tileDef.ObjStats.Stats = new KeyValuePair<StatsType, object>[] {
                                new KeyValuePair<StatsType, object> (StatsType.ObjectConnection,
                                (int) ConnectionComputer.Compute ((xx, yy) => Owner.Map[x + xx, y + yy].ObjectType == tile.ObjectType).Bits)
                            };

                    result.Add (tileDef);

                    return _;
                }).ToList ();
            } catch { }

            return result;
        }

        private IEnumerable<ObjectDef> GetNewStaticsComented () {
            // create a new variable to store all hashes of type 'ObjectDef'
            var RETURN_VAL = new HashSet<ObjectDef> ();

            // if 'Sigh' is null then return an empty hash
            if (Sight == null)
                return RETURN_VAL;
            /*
                ^^^ [!][Hint][!] ^^^

                // Variation for this could be (using C# 7.1+):

                if (Sight == null)
                    return default;
             */

            // create a new variable to store all entries of 'Sight' throught method 'GetSighCircle'
            // without repeated / duplicated entries (looks like 'HashSet' type in fact) to an
            // array type ('List' from LINQ for easy data manipulation)
            var CurrentCircle = Sight.GetSightCircle (0).Distinct ().ToList ();

            /*
                ^^^ [!][Hint][!] ^^^

                // Variation for this could be:

                if (CurrentTiles == null || _map == null)
                    return default;
             */

            // [Tip #1]: I recommend to avoid a possible 'Deadlock' mistake here adding this
            /*
                private var object _getNewStaticsLock = new object();

                private IEnumerable<ObjectDef> GetNewStatics () {
                    // previous code

                    lock (_getNewStaticsLock) 
                    {
                        // your code goes here such as loops checks etc to avoid override callbacks
                        // and a possible unsafe thread issue
                    }
                }
             */

            // do a loop throught 'CurrentCircle'
            foreach (var p in CurrentCircle) {
                // start validating throught loop statement

                // [Tip #2]: this check could be removed and validated outside loop
                // check if 'ClientTiles' or '_map' is null to ignore loop and try next entry
                if (ClientTiles == null || _map == null)
                    continue;

                // check if client tile updated amount is same than current map updated amount,
                // this also receive player positions X / Y to verify integrity of positions and
                // if invalid ignore loop and try next entry
                // [Warning!] Also check 'Tip #3'.
                if (ClientTiles[p.X, p.Y] != _map[p.X, p.Y].UpdateCount)
                    continue;

                // [Tip #3]: this check along '_clientStatics' could be removed and validated outside loop
                // using LINQ along 'Where' clausure
                /*
                    private IEnumerable<ObjectDef> GetNewStatics () {
                        // previous code

                        // using anti-deadlock statement
                        lock (_getNewStaticsLock) {
                            // other validations and such

                            foreach (var p in CurrentCircle.Where(plyr => !_clientStatics.Contains (plyr)
                                && ClientTiles[plyr.X, plyr.Y] != _map[plyr.X, plyr.Y].UpdateCount)) {
                                    // your code goes here
                                }
                        }
                    }
                 */
                // check if player contains in '_clientStatics' or via method 'DistPos' based on player position X / Y
                // is greater than '_sightRadius', if so then ignore loop and try next entry
                if (_clientStatics.Contains (p) || this.DistPos (new WorldPosition { X = p.X, Y = p.Y }) > _sightRadius)
                    continue;

                // create variables for player position X / Y
                /*
                    ^^^ [!][Hint][!] ^^^

                    // Variation for this could be (using C# 7.1+):
                    
                    var (pX, pY) = (p.X, p.Y); // this type does use anonymous method very similar than tuples
                */
                var pointX = p.X;
                var pointY = p.Y;

                // [Tip #4]: this check could be removed and validated inside loop conditions (already
                // validating a valid array for loop using LINQ along 'Where' clausure)
                /*
                    private IEnumerable<ObjectDef> GetNewStatics () {
                        // previous code

                        // using anti-deadlock statement
                        lock (_getNewStaticsLock) {
                            // other validations and such

                            foreach (var p in CurrentCircle.Where(plyr => !_clientStatics.Contains (plyr)
                                && ClientTiles[plyr.X, plyr.Y] != _map[plyr.X, plyr.Y].UpdateCount) &&
                                plyr.X < _mW && plyr.X >= 0 && plyr.Y < _mH && plyr.Y >= 0) {
                                    // your code goes here
                                }
                        }
                    }
                 */
                // check if player position X / Y isn't out of map bounds, if so then ignore loop and try next entry
                if (pointX >= _mW || pointX < 0 || pointY >= _mH || pointY < 0)
                    continue;

                // create a variable to get tile data based on player position on map instance
                var tile = _map[pointX, pointY];

                // verify if tile isn't invalid and player position X / Y doesn't contains already in
                // static elements
                if (tile.ObjectType == 0 || !_clientStatics.Add (new IntPoint (pointX, pointY)))
                    continue;

                // [Tip #5]: method 'ToDefinition' should be simplified along implementation, regarding variable of type
                // 'WorldTile' received along input from '_map' 2 arguments (X / Y) and could be stored internally
                /*
                    public class WorldTile {
                        // first option
                        public float X { get; set; }
                        public float Y { get; set; }

                        public ObjectDef ToDefinition() {
                            var x = X;
                            var y = Y;

                            // your code goes here
                        }
                    }

                    public class WorldTile {
                        // second option (using C# 7.1+)
                        public (float X, float Y) Position { get; set; }
                        
                        public ObjectDef ToDefinition() {
                            var x = Position.X;
                            var y = Position.Y;

                            // your code goes here
                        }
                    }
                 */
                // get definition of tile based on object 'tile' via method 'ToDefinition' based on player position
                var _tileDef = tile.ToDefinition (pointX, pointY);

                // get class ('string' type) based on dictionary 'ObjectDescs'
                string Object_Class = Program.GameData.ObjectDescs[tile.ObjectType].Class;

                // if 'Object_Class' is equal than 'ConnectedWall' or 'CaveWall' then go inside this statement
                if (Object_Class == "ConnectedWall" || Object_Class == "CaveWall") {
                    bool Has_Connection_StatData = false;

                    // do a loop through all stats and validate if stat key is equals than definition 'ObjectConnection' and
                    // stat value property isn't null, if so set 'Has_Connection_StatData'.
                    // [Warning!] variable 'Has_Connection_StatData' could be overrided!
                    // [Tip #6]: this statement could be simplified
                    /*
                        // previous code

                        foreach (var stat in _tileDef.ObjectStats.Stats)
                            if (stat.Key == StatsType.ObjectConnection && stat.Value != null) {
                                Has_Connection_StatData = true; // set this variable to true once, because
                                // only one entry in this loop is enough to check
                                break;
                            }

                        // rest of code
                    */
                    foreach (var STAT in _tileDef.ObjStats.Stats)
                        if (STAT.Key == StatsType.ObjectConnection && STAT.Value != null)
                            Has_Connection_StatData = true;

                    // once variable 'Has_Connection_StatData' is true, execute this statement below
                    if (!Has_Connection_StatData) {
                        // create a variable to store all stats to an array
                        var stats = _tileDef.ObjStats.Stats.ToList ();

                        // add stat (using statements with conditions) to array 'stats'
                        stats.Add (new KeyValuePair<StatsType, object> (StatsType.ObjectConnection, (int) ConnectionComputer.Compute ((xx, yy) => Owner?.GameMap[pointX + xx, pointY + yy].ObjectType == tile.ObjectType).Bits));

                        // override variable '_tileDef' after validation and convert if from 'List<T>' to 'Array<T>'
                        _tileDef.ObjStats.Stats = stats.ToArray ();

                        // clean array 'stats'
                        stats.Clear ();
                    }
                }
            }
        }
    }