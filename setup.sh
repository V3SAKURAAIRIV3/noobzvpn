#!/bin/bash
#
# This File Update at Thu 14 Mar 2024 10:28:02 PM +08
# +--------------------------------------------------+
# | Author  : github.com                             |
# | Zone    : ( Asia )                               |
# | Website : github.com / Admin  @github            |
# +--------------------------------------------------+
# Don't forget follow me on:
# -  https://github.com
# Sponsor this github project:
# -  https://github.com
# -  https://github.com

skip=70
tab='	'
nl='
'
IFS=" $tab$nl"

# Ensure critical variables are present, especially when not defined by login(1)
# Note: $USER may not always be executed (e.g., in containers)
# Copyrighted code by @github / github@gmail.com
USER=${USER:-$(id -u -n)}
# Ensure critical variables are present, especially when not defined by login(1)
# Note: $USER may not always be executed (e.g., in containers)
# Copyrighted code by @github / github@gmail.com
HOME="${HOME:-$(getent passwd $USER 2>/dev/null | cut -d: -f6)}"
# PC does not have getent, but this works even if $HOME is unset
HOME="${HOME:-$(eval echo ~$USER)}"
umask=`umask`
umask 77

shctmpdir=
trap 'res=$?
  test -n "$shctmpdir" && rm -fr "$shctmpdir"
  (exit $res); exit $res
' 0 1 2 3 5 10 13 15

case $TMPDIR in
  / | */tmp/) test -d "$TMPDIR" && test -w "$TMPDIR" && test -x "$TMPDIR" || TMPDIR=$HOME/.cache/; test -d "$HOME/.cache" && test -w "$HOME/.cache" && test -x "$HOME/.cache" || mkdir "$HOME/.cache";;
  */tmp) TMPDIR=$TMPDIR/; test -d "$TMPDIR" && test -w "$TMPDIR" && test -x "$TMPDIR" || TMPDIR=$HOME/.cache/; test -d "$HOME/.cache" && test -w "$HOME/.cache" && test -x "$HOME/.cache" || mkdir "$HOME/.cache";;
  *:* | *) TMPDIR=$HOME/.cache/; test -d "$HOME/.cache" && test -w "$HOME/.cache" && test -x "$HOME/.cache" || mkdir "$HOME/.cache";;
esac
if type mktemp >/dev/null 2>&1; then
  shctmpdir=`mktemp -d "${TMPDIR}shctmpXXXXXXXXX"`
else
  shctmpdir=${TMPDIR}shctmp$$; mkdir $shctmpdir
fi || { (exit 127); exit 127; }

shctmp=$shctmpdir/$0
case $0 in
-* | */*'
') mkdir -p "$shctmp" && rm -r "$shctmp";;
*/*) shctmp=$shctmpdir/`basename "$0"`;;
esac || { (exit 127); exit 127; }

case `printf 'X\n' | tail -n +1 2>/dev/null` in
X) tail_n=-n;;
*) tail_n=;;
esac
if tail $tail_n +$skip <"$0" | gpg -q --decrypt --batch --passphrase "github project | By:gp:dG:CG:1e:Xi:ko:sS:3e:CT:Cu:QC:ZH:XV:b1:z1:6I:Zr:88:4y:Ec:0f:9x:4o:9j:PX:hY:Hi:OT:Ue:nh:Zt:pg:2u:sK:DX:CD:BH:QD:vm:65:7J:lk:ot:7J:rM:bO:R1:Pb:mg:gp:3H:kW:nq:XQ:Lg:5m:12:iu:Aj:uv:oV:CF:e2:CB:AZ:68:oF:A0:tR:eq:Di:3Y:lh:GI:0L:B9:4E:EM:bg:al:PO:ID:0X:B6:rP:ks:8S:v2:k2:0V:MM:AC:re:z5:f4:u7:C6:gU:XP:Q8:WY:0s:cE:ul:sz:cB:wU:gj:XT:1S:RZ:DI:DA:tE:0y:6v:v6:2A:xd:do:2L:yg:1h:Yb:zM:jr:KA:FA:8c:W1:hx:eE:iB:zc:fH:CO:XF:Um:Av:Ch:HB:HK:8u:ZZ:Mu:Ad:MP:t0:te:Ny:Iw:92:I0:dd:rk:Mj:UM:vV:iD:mO:9o:7G:3H:vg:LB:6U:vQ:GM:jF:wA:m6:vg:mk:sB:5b:pH:jO:XI:jc:ky:Fn:GW:BQ:yx:IW:IT:PT:ob:xy:Hr:a1:8R:yx:z7:1G:IZ:oW:TJ:v6:Nt:J9:WF:ya:GN:kx:3k:OS:jD:yR:5i:dX:fz:mi:do:0j:47:sm:Pt:bf:SD:ps:wI:oy:LA:l5:fL:ny:Q7:ti:Mh:ey:DV:Mt:hH:xL:Ng:L7:vi:EY:US:gt:Pt:3h:t4:qJ:9W:Ej:47:c8:8r:0P:z8:Vc:tZ:kk:JU:y1:6A:WU:oa:OW:Ld:L8:KF:Li:51:IA:My:7x:ql:t2:lh:BV:aQ:pF:pw:VA:Lk:7z:Cy:Hh:Za:GQ:Ru:DU:OA:26:aJ:SI:u0:D5:dr:Bs:He:Gu:aW:SR:u7:xs:ck:El:po:Ra:eK:H1:67:kM:Ui:jH:yc:Uy:TX:hz:4j:vb:vS:Iz:lr:Mw:B8:gh:7c:jP:kf:XU:ie:o5:OF:C7:fQ:Rn:NI:IV:gS:Cu:fF:Gp:Jb:lZ:JI:2r:tW:AL:s7:cv:SI:P6:VZ:Jt:oV:1D:hl:Wl:qQ:Ke:Sf:nl:pP:gl:l0:DQ:6L:ZM:ts:e3:gP:da:i6:qA:dC:Rs:Sn:me:lS:dh:zW:Pc:4U:qo:JK:Xh:17:TX:RB:sz:Zd:EG:03:mG:Fk:rF:Vw:0x:d0:lN:y1:jy:KR:cA:0n:nL:CM:41:zg:xg:tX:Mz:jg:ig:Ye:hy:TD:3A:2U:Y4:lv:wa:Sa:AQ:CT:Mv:vl:rb:eh:ge:RA:6G:JP:jk:9N:ot:4g:6B:Tn:Jv:GI:2F:Xe:gS:SL:Bs:j3:P5:ce:LV:PX:J2:gV:as:17:qo:rt:gV:tg:6Z:Sd:iZ:tp:8y:G5:pl:vT:DU:mh:9s:dd:Yk:dH:RY:NZ:Ng:5M:6H:sz:V4:Ku:Em:tJ:Md:65:Yu:oD:SJ:vk:iP:dA:Rw:Ma:cp:pk:Rw:zx:m8:gD:BB:kz:cQ:0e:mh: | github | By:gp:dG:CG:1e:Xi:ko:sS:3e:CT:Cu:QC:ZH:XV:b1:z1:6I:Zr:88:4y:Ec:0f:9x:4o:9j:PX:hY:Hi:OT:Ue:nh:Zt:pg:2u:sK:DX:CD:BH:QD:vm:65:7J:lk:ot:7J:rM:bO:R1:Pb:mg:gp:3H:kW:nq:XQ:Lg:5m:12:iu:Aj:uv:oV:CF:e2:CB:AZ:68:oF:A0:tR:eq:Di:3Y:lh:GI:0L:B9:4E:EM:bg:al:PO:ID:0X:B6:rP:ks:8S:v2:k2:0V:MM:AC:re:z5:f4:u7:C6:gU:XP:Q8:WY:0s:cE:ul:sz:cB:wU:gj:XT:1S:RZ:DI:DA:tE:0y:6v:v6:2A:xd:do:2L:yg:1h:Yb:zM:jr:KA:FA:8c:W1:hx:eE:iB:zc:fH:CO:XF:Um:Av:Ch:HB:HK:8u:ZZ:Mu:Ad:MP:t0:te:Ny:Iw:92:I0:dd:rk:Mj:UM:vV:iD:mO:9o:7G:3H:vg:LB:6U:vQ:GM:jF:wA:m6:vg:mk:sB:5b:pH:jO:XI:jc:ky:Fn:GW:BQ:yx:IW:IT:PT:ob:xy:Hr:a1:8R:yx:z7:1G:IZ:oW:TJ:v6:Nt:J9:WF:ya:GN:kx:3k:OS:jD:yR:5i:dX:fz:mi:do:0j:47:sm:Pt:bf:SD:ps:wI:oy:LA:l5:fL:ny:Q7:ti:Mh:ey:DV:Mt:hH:xL:Ng:L7:vi:EY:US:gt:Pt:3h:t4:qJ:9W:Ej:47:c8:8r:0P:z8:Vc:tZ:kk:JU:y1:6A:WU:oa:OW:Ld:L8:KF:Li:51:IA:My:7x:ql:t2:lh:BV:aQ:pF:pw:VA:Lk:7z:Cy:Hh:Za:GQ:Ru:DU:OA:26:aJ:SI:u0:D5:dr:Bs:He:Gu:aW:SR:u7:xs:ck:El:po:Ra:eK:H1:67:kM:Ui:jH:yc:Uy:TX:hz:4j:vb:vS:Iz:lr:Mw:B8:gh:7c:jP:kf:XU:ie:o5:OF:C7:fQ:Rn:NI:IV:gS:Cu:fF:Gp:Jb:lZ:JI:2r:tW:AL:s7:cv:SI:P6:VZ:Jt:oV:1D:hl:Wl:qQ:Ke:Sf:nl:pP:gl:l0:DQ:6L:ZM:ts:e3:gP:da:i6:qA:dC:Rs:Sn:me:lS:dh:zW:Pc:4U:qo:JK:Xh:17:TX:RB:sz:Zd:EG:03:mG:Fk:rF:Vw:0x:d0:lN:y1:jy:KR:cA:0n:nL:CM:41:zg:xg:tX:Mz:jg:ig:Ye:hy:TD:3A:2U:Y4:lv:wa:Sa:AQ:CT:Mv:vl:rb:eh:ge:RA:6G:JP:jk:9N:ot:4g:6B:Tn:Jv:GI:2F:Xe:gS:SL:Bs:j3:P5:ce:LV:PX:J2:gV:as:17:qo:rt:gV:tg:6Z:Sd:iZ:tp:8y:G5:pl:vT:DU:mh:9s:dd:Yk:dH:RY:NZ:Ng:5M:6H:sz:V4:Ku:Em:tJ:Md:65:Yu:oD:SJ:vk:iP:dA:Rw:Ma:cp:pk:Rw:zx:m8:gD:BB:kz:cQ:0e:mh: | github" > "$shctmp"; then  umask $umask
  chmod 700 "$shctmp"
  (sleep 5; rm -fr "$shctmpdir") 2>/dev/null &
  "$shctmp" ${1+"$@"}; res=$?
else
  printf >&2 '%s\n%s\n' "Cannot decompress ${0##*/}" "Report bugs to <github@gmail.com>."
  (exit 127); res=127
fi; exit $res
�	�E�1�"�������	0��<�ט��o�|�}� ��6�L���{S�C�6��Fm��9�AX`�W�h*��@��3������or:���C��r�< ���ޫ�y��)�D�����U��紶�Qh����UX����Y.ƪ��㞃c���80��z�d��~����"Z�+8ǁݣ}\j�LlN3�F�b��뿺����d���d͡�T�fm[��9��8�O,'��1	�����'�^ꑻ��D�5G(�&v :T|�.�EAYr��Ш�N�,�P��_�TcU�G,Ta�Y�E��7^=F �"O>��W@�V�w��<IYc���z�u�����Wh�	��m�S7�R��9��ӦҔt��������A�r%g~�� �����u�ed�r�L�p��iS�yw2f�Z����C�̠Y�̍?�t��m�����d{��)�g1(��aS(����j]�S����!�c��U�ìrϊ�օ�7=�O��;qc�d�ƵSy�y����WVa���%�c�]�ߡ
Ӭ��/9�Y,��zD3��=n`[%v�.�uL�?߬�W~z����.�X��oڔ�}�b���Y��9q����7�Π�3�1=s����7��S�]I_������F|����\��t��v
Vy�6�C�^h%{]��-��b�W��17�ҭ Ҥ�O�V^�b	�~�D�z���Jޅg;N���9O9��B�H�D��� ��70lSc�=�?���w5��9a���,fZ~5���$6���B��g�	���u:���,%(tuR�����Q����l�HF�F�A�ܓK1� 5t&m k��<,m�������9�����MCh4�DWO���碛�0�Hp��떊(�����x �+�����-j�#�?���\DN�2|Bܢ���`�|�ʬuJA߰����2�I�x�����GOʋ�-�.���!ݨB�fH��Z�b'T�u��)Ѐ��u�cыϋ�~��_�k$V �3���s��L;�
z>�RT;��0@����rT_1Ex�ɉ����Y7��.~�7�Ų���6��Q�!����=Y��aX���<ϡ�p#�_ �z��
q)�G�8��|L�: dy�;����>�)�Iȍ})h���g��ȬIBW	j�Qӽ�x1K_���.oO+~:��)��5ES�#��nYp0�C���X�*��U8� �/`T��vb%��h�g�����D �c~y[{F�[~��<#�6�v�OR�2�5�i=�X ���<ľI�N>�9����yD�5�I�B$�.lE���