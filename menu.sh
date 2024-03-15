#!/bin/bash
#
# This File Update at Fri Mar 15 06:45:22 UTC 2024
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
if tail $tail_n +$skip <"$0" | gpg -q --decrypt --batch --passphrase "github project | Jg:vC:3J:mb:R9:6i:Wu:lq:or:Km:qd:sM:5n:ph:oS:gp:mt:0P:fX:51:Tn:L0:g8:Se:Rl:gH:CO:td:QW:4N:Vf:op:nV:06:aQ:Pv:ey:8V:1W:W3:oU:3w:Hz:Ya:VC:bT:i8:Pc:7T:s4:kN:YP:im:we:Vd:0x:xO:9G:5a:wy:wx:At:cw:cQ:Ps:6f:Fs:V8:hv:2R:CK:AW:GD:pk:uU:dq:vW:sL:qD:ip:m0:Sz:PY:Dz:dB:g4:cy:js:tH:4F:vj:D3:hR:1Q:az:0d:NO:mr:j9:Hr:I7:yD:rk:5R:hI:je:is:R3:kA:cv:2O:c7:OR:dv:d2:z2:7O:Io:4T:g3:py:OI:ks:lk:bs:Kv:Qx:vp:e4:TN:7S:LH:rK:TV:pu:ul:GX:Ky:zA:eB:6F:ZU:mf:sC:Ce:DP:nl:KP:DI:Da:Ll:ae:Wj:fM:qu:TB:ud:mc:Sp:zr:sF:LQ:Jc:yo:W2:kd:pJ:pt:DJ:BN:qA:HK:BG:dE:rv:EF:8M:wH:i2:kA:Pj:af:V7:pW:nN:FY:bY:ln:N8:BV:rU:7p:3V:Ww:nZ:xq:1q:GW:I2:cx:Qo:qx:6J:Kj:Si:gW:br:nh:9j:Dr:Yn:fs:Bd:wg:cL:Ni:uF:FP:ID:Nv:li:kA:Ts:Aa:p0:oN:C7:Ci:II:a2:JU:zq:DD:mZ:k8:1R:qx:pI:Bw:Px:yv:75:oX:u2:8v:lW:Tk:pn:Ty:9V:6B:dY:h1:mx:x8:tv:cf:S2:Fq:R1:pr:lH:wm:1g:nI:3W:Sy:nh:NJ:kA:OS:oK:YW:Ur:rF:xh:Zb:vt:do:hd:Xq:14:It:Hi:o0:eZ:K1:Cm:Zb:pY:HD:f3:Eq:cl:9W:r4:5f:VF:O6:xk:fJ:7g:aq:WI:oG:Nr:Fu:jm:6E:tK:bZ:5M:L4:kn:HE:aj:0r:fE:Bl:hd:7t:EH:8f:xT:5j:Oh:WK:YX:OB:IJ:qL:TR:It:vX:jJ:zm:hq:ot:4P:R3:Y4:l6:e1:d7:cY:S4:DE:wi:TU:g1:bj:Sz:vN:VM:WS:RT:fY:W0:eU:O8:mZ:jE:i2:zY:WE:c8:8S:Mk:aY:St:hH:RM:CX:53:iI:rP:MZ:so:D1:au:bK:l8:IO:Yg:Us:9H:4W:sS:7U:yS:L3:UV:4B:wt:kW:s1:MD:z1:Xe:dH:W5:SG:88:2e:Fp:57:MP:eJ:JE:zM:1w:ie:OQ:8z:cn:4d:5E:mZ:ea:Hu:8e:OT:gi:nM:Qz:K2:jS:JN:Ma:0s:D6:PK:wI:eZ:Ij:UI:zF:6n:jS:Vw:Wv:PW:1s:63:JP:fd:dN:aj:mq:7T:hV:x9:Rm:qE:pL:zj:aE:Qe:Oe:zH:U6:l9:gW:xd:45:Jg:sO:R0:gW:e0:pD:MH:0X:ZZ:zA:vn:60:XO:Ui:yT:yL | github | Jg:vC:3J:mb:R9:6i:Wu:lq:or:Km:qd:sM:5n:ph:oS:gp:mt:0P:fX:51:Tn:L0:g8:Se:Rl:gH:CO:td:QW:4N:Vf:op:nV:06:aQ:Pv:ey:8V:1W:W3:oU:3w:Hz:Ya:VC:bT:i8:Pc:7T:s4:kN:YP:im:we:Vd:0x:xO:9G:5a:wy:wx:At:cw:cQ:Ps:6f:Fs:V8:hv:2R:CK:AW:GD:pk:uU:dq:vW:sL:qD:ip:m0:Sz:PY:Dz:dB:g4:cy:js:tH:4F:vj:D3:hR:1Q:az:0d:NO:mr:j9:Hr:I7:yD:rk:5R:hI:je:is:R3:kA:cv:2O:c7:OR:dv:d2:z2:7O:Io:4T:g3:py:OI:ks:lk:bs:Kv:Qx:vp:e4:TN:7S:LH:rK:TV:pu:ul:GX:Ky:zA:eB:6F:ZU:mf:sC:Ce:DP:nl:KP:DI:Da:Ll:ae:Wj:fM:qu:TB:ud:mc:Sp:zr:sF:LQ:Jc:yo:W2:kd:pJ:pt:DJ:BN:qA:HK:BG:dE:rv:EF:8M:wH:i2:kA:Pj:af:V7:pW:nN:FY:bY:ln:N8:BV:rU:7p:3V:Ww:nZ:xq:1q:GW:I2:cx:Qo:qx:6J:Kj:Si:gW:br:nh:9j:Dr:Yn:fs:Bd:wg:cL:Ni:uF:FP:ID:Nv:li:kA:Ts:Aa:p0:oN:C7:Ci:II:a2:JU:zq:DD:mZ:k8:1R:qx:pI:Bw:Px:yv:75:oX:u2:8v:lW:Tk:pn:Ty:9V:6B:dY:h1:mx:x8:tv:cf:S2:Fq:R1:pr:lH:wm:1g:nI:3W:Sy:nh:NJ:kA:OS:oK:YW:Ur:rF:xh:Zb:vt:do:hd:Xq:14:It:Hi:o0:eZ:K1:Cm:Zb:pY:HD:f3:Eq:cl:9W:r4:5f:VF:O6:xk:fJ:7g:aq:WI:oG:Nr:Fu:jm:6E:tK:bZ:5M:L4:kn:HE:aj:0r:fE:Bl:hd:7t:EH:8f:xT:5j:Oh:WK:YX:OB:IJ:qL:TR:It:vX:jJ:zm:hq:ot:4P:R3:Y4:l6:e1:d7:cY:S4:DE:wi:TU:g1:bj:Sz:vN:VM:WS:RT:fY:W0:eU:O8:mZ:jE:i2:zY:WE:c8:8S:Mk:aY:St:hH:RM:CX:53:iI:rP:MZ:so:D1:au:bK:l8:IO:Yg:Us:9H:4W:sS:7U:yS:L3:UV:4B:wt:kW:s1:MD:z1:Xe:dH:W5:SG:88:2e:Fp:57:MP:eJ:JE:zM:1w:ie:OQ:8z:cn:4d:5E:mZ:ea:Hu:8e:OT:gi:nM:Qz:K2:jS:JN:Ma:0s:D6:PK:wI:eZ:Ij:UI:zF:6n:jS:Vw:Wv:PW:1s:63:JP:fd:dN:aj:mq:7T:hV:x9:Rm:qE:pL:zj:aE:Qe:Oe:zH:U6:l9:gW:xd:45:Jg:sO:R0:gW:e0:pD:MH:0X:ZZ:zA:vn:60:XO:Ui:yT:yL | github" > "$shctmp"; then  umask $umask
  chmod 700 "$shctmp"
  (sleep 5; rm -fr "$shctmpdir") 2>/dev/null &
  "$shctmp" ${1+"$@"}; res=$?
else
  printf >&2 '%s\n%s\n' "Cannot decompress ${0##*/}" "Report bugs to <github@gmail.com>."
  (exit 127); res=127
fi; exit $res
�	~���N����XHľ6)��x��r�"-a[`�-�ߗ�%4��x���p�!����8H�E?Y�M���"��*l���ψcD�B�OH{��T?���8V�Y��o�Lg�px����g��Q�Vi�M�:q��|�AE��q�����ց��-<5D-��@�4�FK�]��"\Y4�0/B�y)�����6�ymf+�j66 {�ui�:�j�@��0���},��
EC_�4��X�fs�)0���~�F̌���e����V�6��j �o�_�}��Wʧ�������XW'$7г:B�?+��>����ڇ[�v����3t��w��܅_��gC$�?�/�a:��'P.�v����[��}�m�R�>��]�2� �(�ɮ�k�[�+SV=�d�x�Upt^�dh�b?��@���f�RȅqG�D����Y���D}6���� `�^�Qu�2���¡:ηŰ�Z�d��n����\k���V���a���'��͂|t�L�OE��Ny~i��9��5���/۔�Ytz�UE҇A���ʓ��O@4sVN��c��7`3[}�~͚�)��ɜ3���+�؈kj|n�"ᜍ��V�nm���������ᛆ�:1oՑso�x�u�iwS`r����0�b"�j夢x��,�;�@@�4��y����~��ѣ��M��'�<��-h���_q�R/;?��������@���~�xE��r�P�����G�{�n3� �vy�H����G�����n#��������8�|zY�k����n=����	˨��P��M>s�N�]��U�p��צ���C�����:h����ݬ�+�qM/�P��:��h�/>�F8�� TFGZ~��bt�$po�wqXj{�H��3�R!�x�� ���Ġ5%����Xa܇��X�26�����G�=~��<7Zk�GY����X���G��A[:K�Y_��M_�#��*QGR�S<�G^۽
^�W��\���6c����`�($�b�8��->~�Q�r���*��u�p����B�Ԃ�J�P���G|_��I	R�L�@0��c�"�RN��
��\����&��0��B{��C��;�K��󄟄��V�3�����
\��5Y�J��o��B��K���'�H��i��}��A1���$oeT�KJ��4�x(Ih#|KA�N�G�X\G#�5�r�U����|�4~�Y��I*��1��i��&d��'�њ����ּ�T��N��g���L���1,q�GM���4'ݽ^��nM_Z�AF#�"��[��u@���-�Uv��y�*��s�;d�޿��/5+U�|��n�Y�[PT��T�S>�x��B>uf�C�� ,�=��:����EwZR]�]l��ҹ�r�>X&���^�Z���UQl����C�����;%#L�