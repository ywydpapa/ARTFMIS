$(document).on('click','#consult_contract_list_table > tbody > tr',function () {
    let tbody = $(this).parent();
    tbody.find('tr').removeClass('active');
    $(this).addClass('active');

    let href = $(this).find('a').attr('href');
    let linkFirst = href.indexOf('(');
    let linkLast = href.indexOf(')');
    let link = href.substring(linkFirst+2, linkLast-1);
    fnSetContdetail(link);
});



$(document).on('click','#consult_sett_list_table > tbody > tr',function () {
    let tbody = $(this).parent();
    tbody.find('tr').removeClass('active');
    $(this).addClass('active');

    let href = $(this).find('a').attr('href');
    let linkFirst = href.indexOf('(');
    let linkLast = href.indexOf(')');
    let link = href.substring(linkFirst+2, linkLast-1);
    fnSetcontdetail(link);
});

$(document).on('click','#goodslist > tbody > tr > td:not(.first):nth-child(odd)',function () {
    let td0 = $(this);
    let td1 = $(this).next();
    let tbody = td0.closest('tbody');
    tbody.find('td').removeClass('active');
    td0.addClass('active');
    td1.addClass('active');

    let href = td0.find('a').attr('href');
    let linkFirst = href.indexOf('(');
    let linkLast = href.indexOf(')');
    let link = href.substring(linkFirst+2, linkLast-1);
    fn_Reload04(link);
});

$(document).on('click','#ftablelist > tbody > tr > td:not(.first):nth-child(even)',function () {
	let td0 = $(this);
    let td1 = $(this).next();
    let tbody = td0.closest('tbody');
    tbody.find('td').removeClass('active');
    td0.addClass('active');
	td1.addClass('active');
    let href = td0.find('a').attr('href');
    let linkFirst = href.indexOf('(');
    let linkLast = href.indexOf(')');
    let link = href.substring(linkFirst+2, linkLast-1);
    fnSetftabledetail(link);
});

