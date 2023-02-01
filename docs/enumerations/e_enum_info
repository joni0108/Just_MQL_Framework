# Informations | Enumeration
Informations enumeration identifiers are used in and `CInfo()->`[GetString()](../modules/main/info-getString.md), `CInfo()->`[GetInteger()](../modules/main/info-getInteger.md), `CInfo()->`[GetDouble()](../modules/main/info-getDouble.md) and `CInfo()->`[GetBoolean()](../modules/main/info-getBoolean.md) methods.

### ENUM_INFO_STRING
| ID                        | Description                                         |
| :------------------------ | :-------------------------------------------------- |
| `TERMINAL_INFO_LANGUAGE`  | The language of the Metatrader Terminal             |
| `TERMINAL_INFO_COMPANY`   | The company name of the Metatrader Terminal         |
| `TERMINAL_INFO_NAME`      | The name of the Metatrader Terminal                 |
| `TERMINAL_INFO_PATH`      | The path of the Metatrader Terminal                 |
| `TERMINAL_INFO_PATH_DATA` | The path of the Metatrader Terminal data folder     |
| `ACCOUNT_INFO_NAME`       | The name of the account                             |
| `ACCOUNT_INFO_SERVER`     | The server of the account                           |
| `ACCOUNT_INFO_CURRENCY`   | The currency of the account                         |
| `ACCOUNT_INFO_COMPANY`    | The company of the account                          |
| `ACCOUNT_INFO_TYPE`       | The type of the account, from (DEMO, REAL, CONTEST) |

**Notes:**<br>
1. `ACCOUNT_INFO_TYPE` will return the account type as a string. It can return between `"DEMO"`, `"REAL"` or `"CONTEST"`.<br>

### ENUM_INFO_INTEGER
| ID                              | Description                                    |
| :------------------------------ | :--------------------------------------------- |
| `TERMINAL_INFO_BUILD`           | The build number of the Metatrader Terminal    |
| `TERMINAL_INFO_MAX_BARS`        | The maximum number of bars in the chart        |
| `TERMINAL_INFO_CPU_CORES`       | The number of CPU cores                        |
| `TERMINAL_INFO_DISK_SPACE`      | The disk space in MB                           |
| `TERMINAL_INFO_MEMORY_PHYSICAL` | The physical memory in MB                      |
| `TERMINAL_INFO_MEMORY_TOTAL`    | The total memory allocated to Metatrader in MB |
| `TERMINAL_INFO_MEMORY_USED`     | The used memory allocated to Metatrader in MB  |
| `TERMINAL_INFO_MEMORY_FREE`     | The free memory allocated to Metatrader in MB  |
| `TERMINAL_INFO_DPI`             | The screen DPI of the Metatrader Terminal      |
| `TERMINAL_INFO_LAST_PING`       | The last ping of the Metatrader Terminal       |
| `ACCOUNT_INFO_LOGIN`            | The login number of the account                |
| `ACCOUNT_INFO_LEVERAGE`         | The leverage of the account                    |
| `ACCOUNT_INFO_LIMIT_ORDERS`     | The maximum of pending orders, 0 - unlimited.  |

**Notes:**<br>
1. The `ACCOUNT_INFO_LIMITS_ORDERS` will return `0` if the maximum of trading orders is unlimited.<br>

### ENUM_INFO_DOUBLE
| ID                         | Description                    |
| :------------------------- | :----------------------------- |
| `ACCOUNT_INFO_BALANCE`     | The balance of the account     |
| `ACCOUNT_INFO_CREDIT`      | The credit of the account      |
| `ACCOUNT_INFO_PROFIT`      | The profit of the account      |
| `ACCOUNT_INFO_EQUITY`      | The equity of the account      |
| `ACCOUNT_INFO_MARGIN`      | The margin of the account      |
| `ACCOUNT_INFO_MARGIN_FREE` | The free margin of the account |

### ENUM_INFO_BOOL
| ID                                    | Description                                         |
| :------------------------------------ | :-------------------------------------------------- |
| `TERMINAL_INFO_SERVER_CONNECTED`      | The connection status of the Metatrader Terminal    |
| `TERMINAL_INFO_DLLS_ALLOWED`          | The DLLs status of the Metatrader Terminal          |
| `TERMINAL_INFO_TRADE_ALLOWED`         | If all the autotrading options are enabled          |
| `TERMINAL_INFO_EMAIL_ALLOWED`         | The email status of the Metatrader Terminal         |
| `TERMINAL_INFO_NOTIFICATIONS_ALLOWED` | The notifications status of the Metatrader Terminal |
| `TERMINAL_INFO_FTP_ALLOWED`           | The FTP status of the Metatrader Terminal           |

**Notes:**<br>
1. `TERMINAL_INFO_TRADE_ALLOWED` will return `true` if all the autotrading options are enabled. This includes:
   1. Autotrading Button
   2. Allow live trading in the expert properties while loading
   3. Allow automated trading in expert properties in the `settings/tools` tab
   4. The account is allowed to trade.<br>
2. `TERMINAL_INFO_NOTIFICATIONS_ALLOWED` will return `true` if the notifications are enabled in the Metatrader Terminal and the Push notification MQ ID is setup properly.<br>