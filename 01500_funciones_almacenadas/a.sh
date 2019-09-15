clear

grep cuentas_contables 00200_f_crear_datos_holding.sql |  \
awk '{                                                    \
  printf "%s - %s - %s - %s - %s\n",substr($0,71,1)       \
                                   ,substr($0,76,2)       \
                                   ,substr($0,82,2)       \
                                   ,substr($0,88,4)       \
                                   ,substr($0,120,65)     \
}'                                                        \
| grep -v " - 0000"                                    \
| sed "1,$ s/'//"                                         \
| more

