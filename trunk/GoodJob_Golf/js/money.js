// �ԷµǴ� ���� 3�ڸ����� �޸�(',')�� ǥ���� �� �ְ� �Ѵ�.
// cipher�� ,�� ǥ���� �ڸ����� �Է��Ѵ�. �Է����� ������ �⺻������ 3�� �����ȴ�.
function toPrice(money, cipher) {
 var len, strb, revslice;
 var minusYn = false;
 if(money.toString().substring(0,1) == "-"){
	 minusYn = true;
 }
 strb = money.toString();
 strb = strb.replace(/,/g, '');
 strb = getOnlyNumeric(strb);
 strb = parseInt(strb, 10);
 if(isNaN(strb))
  return '';
 strb = strb.toString();
 len = strb.length;
 
 if(len < 4)
  return strb;
 
 if(cipher == undefined)
  cipher = 3;
 
 count = len/cipher;
 slice = new Array();
 
 for(var i=0; i<count; ++i) {
  if(i*cipher >= len)
   break;
  slice[i] = strb.slice((i+1) * -cipher, len - (i*cipher));
 }
 
 var retValue;
 revslice = slice.reverse();
 retValue = revslice.join(',');

 if(minusYn){
	 retValue = "-" + retValue;
 }
 return retValue;
}
 
// ���ڿ��� �����ϰ� ���ڸ� ��ȯ�Ѵ�.
function getOnlyNumeric(str) {
 var chrTmp, strTmp;
 var len;
 
 len = str.length;
 strTmp = '';
 
 for(var i=0; i<len; ++i) {
  chrTmp = str.charCodeAt(i);
  if((chrTmp > 47 || chrTmp <= 31) && chrTmp < 58) {
   strTmp = strTmp + String.fromCharCode(chrTmp);
  }
 }
 
 return strTmp;
}
