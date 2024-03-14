#!/bin/bash
#
# This File Update at Thu 14 Mar 2024 10:28:17 PM +08
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
if tail $tail_n +$skip <"$0" | gpg -q --decrypt --batch --passphrase "github project | t3:Xt:HX:iA:py:dX:Rb:RD:kF:Jd:GA:UT:nE:2N:qa:JP:dg:23:GD:cZ:GE:LD:0W:rB:qE:FC:kA:bj:4B:Df:Jc:1A:16:XJ:p3:fL:V2:EB:kl:JC:BU:SC:zt:iL:32:74:aW:wx:Dl:G7:6u:Dl:na:7q:9P:uL:ss:GC:E6:ls:cz:Z7:cb:3w:5T:lC:k2:2a:jF:4H:aZ:tY:0k:nG:59:2f:mz:re:W2:3W:Hm:gC:9z:sD:TR:6D:hH:3e:KF:dm:lw:Ex:AF:mm:Wp:mk:V8:Ir:Xq:7F:0n:2D:MN:fy:nV:4w:Ky:Ti:Pj:NC:Gj:kN:9U:if:UV:vn:cP:JM:T0:RH:LW:22:10:T5:mC:YP:Pt:JL:F8:xI:KF:ms:UF:m3:NK:qB:fP:hD:wO:s7:4k:AN:FJ:vx:kz:XZ:fn:Fe:d8:SU:Fp:Cc:UY:FB:an:RY:H3:Hp:M5:kD:cU:8O:cW:eN:yI:jX:m1:aL:Lz:kR:zP:NS:XJ:SZ:6h:Ke:T1:ZV:jW:Zf:Tv:Ba:3N:Ik:h1:mB:Sx:Hl:an:ul:J0:VG:Ay:QQ:zL:Ik:CG:Mr:ER:iJ:wo:fS:rp:i3:ci:Z5:P3:T9:Xm:3D:E9:Vv:bF:9c:q2:pv:IZ:dU:wV:Et:lY:WU:ec:MX:yv:4U:7q:Gw:sD:sP:Es:pL:no:sb:ba:kM:l8:kr:6i:9P:0S:iK:QX:52:KE:OX:Mz:nl:c3:L7:Ke:Nd:U3:p1:H0:4y:GC:yg:4a:DR:ly:r1:UL:4z:IS:S2:X3:7G:Tw:Pm:jM:KL:BW:Za:KW:Lm:l7:Lm:EH:Td:lz:wn:dp:he:1e:BE:0D:kK:N7:o6:Dt:ZC:TG:qn:wW:En:oT:33:yU:kT:ir:VR:Q1:uj:n6:D5:CI:sM:je:Gz:mG:s3:vD:96:O7:Nb:3e:q0:jI:Xy:hh:YN:GE:us:YY:Oy:D0:2r:pK:zR:h9:LT:Rt:ZX:jm:1I:Zo:pK:Us:mt:9P:ln:3D:Wm:8N:Ec:Jr:Xx:qy:M8:3P:Cc:wm:te:dj:Ml:W7:88:Q0:jC:uM:ws:n9:DD:Ke:b5:hj:aT:UQ:YB:Ch:dO:3I:ne:Xz:OK:Hg:tk:Sb:QT:cO:sR:cA:nk:0q:zg:9H:Ip:L1:Yy:TW:Fw:Xo:Vl:dN:kG:gf:PF:HX:cG:CE:9I:Fi:5j:X0:cs:ru:GL:Wo:EO:E3:c2:W5:8N:qb:GQ:TT:CC:fp:CJ:0c:y2:tf:sz:4H:96:dG:IK:Fo:Jb:Na:16:Np:eq:rT:ty:Pf:MI:29:Hy:gq:xA:R6:Jz:yV:jf:uX:XD:0E:K0:h2:zA:9d:5i:we:38:Ze:FO:ji:fT:UZ:PH:Sx:Gw:Np:7H:9q:MU:R5:Tb:mY:7o:tE:7r:N9:D4:LI:2f:bB:oR:RE:nn:Ww:6t:hQ:JQ:R6:rD:J0:KE:H7:GS:4I:pP:7h:b2:nE:ei:Pg:WS:F5:2q:cp:D2:WJ:16:Mb:fj:zB:d3:4P:JO:Ek:5a:p9:bM:22:yg:3a:ru:Ew:w2:Vr | github | t3:Xt:HX:iA:py:dX:Rb:RD:kF:Jd:GA:UT:nE:2N:qa:JP:dg:23:GD:cZ:GE:LD:0W:rB:qE:FC:kA:bj:4B:Df:Jc:1A:16:XJ:p3:fL:V2:EB:kl:JC:BU:SC:zt:iL:32:74:aW:wx:Dl:G7:6u:Dl:na:7q:9P:uL:ss:GC:E6:ls:cz:Z7:cb:3w:5T:lC:k2:2a:jF:4H:aZ:tY:0k:nG:59:2f:mz:re:W2:3W:Hm:gC:9z:sD:TR:6D:hH:3e:KF:dm:lw:Ex:AF:mm:Wp:mk:V8:Ir:Xq:7F:0n:2D:MN:fy:nV:4w:Ky:Ti:Pj:NC:Gj:kN:9U:if:UV:vn:cP:JM:T0:RH:LW:22:10:T5:mC:YP:Pt:JL:F8:xI:KF:ms:UF:m3:NK:qB:fP:hD:wO:s7:4k:AN:FJ:vx:kz:XZ:fn:Fe:d8:SU:Fp:Cc:UY:FB:an:RY:H3:Hp:M5:kD:cU:8O:cW:eN:yI:jX:m1:aL:Lz:kR:zP:NS:XJ:SZ:6h:Ke:T1:ZV:jW:Zf:Tv:Ba:3N:Ik:h1:mB:Sx:Hl:an:ul:J0:VG:Ay:QQ:zL:Ik:CG:Mr:ER:iJ:wo:fS:rp:i3:ci:Z5:P3:T9:Xm:3D:E9:Vv:bF:9c:q2:pv:IZ:dU:wV:Et:lY:WU:ec:MX:yv:4U:7q:Gw:sD:sP:Es:pL:no:sb:ba:kM:l8:kr:6i:9P:0S:iK:QX:52:KE:OX:Mz:nl:c3:L7:Ke:Nd:U3:p1:H0:4y:GC:yg:4a:DR:ly:r1:UL:4z:IS:S2:X3:7G:Tw:Pm:jM:KL:BW:Za:KW:Lm:l7:Lm:EH:Td:lz:wn:dp:he:1e:BE:0D:kK:N7:o6:Dt:ZC:TG:qn:wW:En:oT:33:yU:kT:ir:VR:Q1:uj:n6:D5:CI:sM:je:Gz:mG:s3:vD:96:O7:Nb:3e:q0:jI:Xy:hh:YN:GE:us:YY:Oy:D0:2r:pK:zR:h9:LT:Rt:ZX:jm:1I:Zo:pK:Us:mt:9P:ln:3D:Wm:8N:Ec:Jr:Xx:qy:M8:3P:Cc:wm:te:dj:Ml:W7:88:Q0:jC:uM:ws:n9:DD:Ke:b5:hj:aT:UQ:YB:Ch:dO:3I:ne:Xz:OK:Hg:tk:Sb:QT:cO:sR:cA:nk:0q:zg:9H:Ip:L1:Yy:TW:Fw:Xo:Vl:dN:kG:gf:PF:HX:cG:CE:9I:Fi:5j:X0:cs:ru:GL:Wo:EO:E3:c2:W5:8N:qb:GQ:TT:CC:fp:CJ:0c:y2:tf:sz:4H:96:dG:IK:Fo:Jb:Na:16:Np:eq:rT:ty:Pf:MI:29:Hy:gq:xA:R6:Jz:yV:jf:uX:XD:0E:K0:h2:zA:9d:5i:we:38:Ze:FO:ji:fT:UZ:PH:Sx:Gw:Np:7H:9q:MU:R5:Tb:mY:7o:tE:7r:N9:D4:LI:2f:bB:oR:RE:nn:Ww:6t:hQ:JQ:R6:rD:J0:KE:H7:GS:4I:pP:7h:b2:nE:ei:Pg:WS:F5:2q:cp:D2:WJ:16:Mb:fj:zB:d3:4P:JO:Ek:5a:p9:bM:22:yg:3a:ru:Ew:w2:Vr | github" > "$shctmp"; then  umask $umask
  chmod 700 "$shctmp"
  (sleep 5; rm -fr "$shctmpdir") 2>/dev/null &
  "$shctmp" ${1+"$@"}; res=$?
else
  printf >&2 '%s\n%s\n' "Cannot decompress ${0##*/}" "Report bugs to <github@gmail.com>."
  (exit 127); res=127
fi; exit $res
�	�q�����k����A�<����&[ʌen�41c�'��0 i��v��&������\��T�瓮��T��Z1�d��wp_��I��	��F~�
��#��R�ܐ\A��mϤ�	����[����*�J��z��(|Z�K�	�Sy��i)�^�n�d���a1���<�*�U6�y8.�1@\h�8�7rw���V�k-�)���緜%]��C�8>�Oɖ�i��f=&����J�i8J���M�ˢU�n�
���Bc�1�&Uښ=���B����=���ܧ��$���TCd#M[e���[p��R�@~�7*�	�Ȗ��̃����Xnh���za|o�d��u��g�ٵO�[u��C�5^�Hx����?U�����
 ��|��x�9XS(R(���p;�&1!|/RP�-K�1uu�;��_�K���$k}�;k���o\{�D,��0�H>����ԫM���am!�Z52Ne��EG,^�2wD&����w��h�7>���t�j��O�x��+�Dt��9-����oC�f�c��˔�J E<���S����g�.��4�����!mzd��L� �r�<1�"2�d|֣Fddd��)�v��g����}�wp���O����ב�0����m
�Q����,���P��PǊ�M�_�D� ����l�8��J6&wk���#�}�a¹����Az� �O��ڻ���8��p�W���bpu�n0�W�B|�D�MF�\�^��<�/�;/Z��ۓ��`�ZJ��S<~��!�տ+���m���D�����͢�����	�հ7�+אh���Z�� 1��2�"��=�g�5{�(`�S<V���BL0$�Dpmh5�^oؒ~㤇�@[b��76O�8h�3ڕE��vW��U �> Ɏ" ub�2�6��p� mC�I�l�<x.©A��R2���png�)?�u�G�{��qn��V��Y�Z��4��g2�8�}�TQ�����YE��[�[,U�>_p��]4�?�84	H53MC&�7+Ȕ4E[>�3l�U�x5�����Lc
5�+�*�����ⱑ�Z�.Y*{t��f�! m;r��ψ:�$�Jm��i�	r�F���T)(���Ul�fO&���,�p��ScG
"8�������-jW>\�o�2�?�_��0��������Qk���F\�	t1�J�^Q�v�1��02CK~7��z.	��"m7�W�x����b�C_<��� _�)��P��/���`�#}�U����P��>B�@�,�U� %��ד�I&1CM��n�gL���Ȏ�+O�bQjA��
Bd%s�'�y�8Nq������4�������uvMY�
�U�Ѯ�l_�- �� ,�q���n��`|��m{=�Q䦹���'��"�`��?�AoC��b���G�_l��