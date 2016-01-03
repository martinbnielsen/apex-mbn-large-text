set define off verify off feedback off
whenever sqlerror exit sql.sqlcode rollback
--------------------------------------------------------------------------------
--
-- ORACLE Application Express (APEX) export file
--
-- You should run the script connected to SQL*Plus as the Oracle user
-- APEX_050000 or as the owner (parsing schema) of the application.
--
-- NOTE: Calls to apex_application_install override the defaults below.
--
--------------------------------------------------------------------------------
begin
wwv_flow_api.import_begin (
 p_version_yyyy_mm_dd=>'2013.01.01'
,p_release=>'5.0.3.00.03'
,p_default_workspace_id=>299106679496250286
,p_default_application_id=>42601
,p_default_owner=>'MBNDATA'
);
end;
/
prompt --application/ui_types
begin
null;
end;
/
prompt --application/shared_components/plugins/dynamic_action/com_mbndata_plugin_large_text
begin
wwv_flow_api.create_plugin(
 p_id=>wwv_flow_api.id(21882161824980354426)
,p_plugin_type=>'DYNAMIC ACTION'
,p_name=>'COM.MBNDATA.PLUGIN.LARGE_TEXT'
,p_display_name=>'MBN Large Text'
,p_category=>'EFFECT'
,p_supported_ui_types=>'DESKTOP'
,p_plsql_code=>wwv_flow_utilities.join(wwv_flow_t_varchar2(
'  function mbn_large_text (',
'    p_dynamic_action in apex_plugin.t_dynamic_action,',
'    p_plugin         in apex_plugin.t_plugin ) return apex_plugin.t_dynamic_action_render_result IS',
'    v_result         apex_plugin.t_dynamic_action_render_result;',
'    v_affected_elements apex_application_page_da_acts.affected_elements%TYPE;',
'    v_width         INTEGER      := p_dynamic_action.attribute_01;',
'    v_height        INTEGER      := p_dynamic_action.attribute_02;',
'  BEGIN',
'    -- Standard debugging messages',
'    IF apex_application.g_debug',
'    THEN',
'      apex_plugin_util.debug_dynamic_action(',
'         p_plugin         => p_plugin,',
'         p_dynamic_action => p_dynamic_action',
'      );',
'    END IF;',
'',
'    -- Include javascript',
'    apex_javascript.add_library(',
'      p_name       => ''mbn_large_text'',',
'      p_directory  => p_plugin.file_prefix,',
'      p_version    => null',
'    );',
'    ',
'    SELECT affected_elements',
'    INTO   v_affected_elements',
'    FROM   apex_application_page_da_acts ',
'    WHERE action_id = p_dynamic_action.id;',
'    ',
'    v_result.javascript_function := ''dk_mbndata_dynamic_large_text_'' || p_dynamic_action.id;',
'    apex_javascript.add_inline_code(',
'     ''function '' || v_result.javascript_function || ''() {'' ||',
'       ''apex.jQuery("'' || v_affected_elements || ''").each(function() {'' ||',
'         ''if (apex.jQuery(this).text() != "" && apex.jQuery(this).height() > '' || v_height || '') {'' ||',
'         ''apex.jQuery(this).attr("data-mbn-width", '' || v_width || '');'' ||',
'         ''apex.jQuery(this).attr("data-mbn-height", '' || v_height || '');'' ||',
'         ''apex.jQuery(this).css("width","''  || v_width || ''px");'' ||',
'         ''apex.jQuery(this).css("height","'' || v_height || ''px");'' ||',
'         ''apex.jQuery(this).css("overflow","hidden");'' ||',
'         ''apex.jQuery(this).css("text-overflow","ellipsis");'' ||',
'         ''apex.jQuery(this).parent().append("<div onclick=\"mbndata.show_large(this);\" style=\"color:blue\; cursor:row-resize\">Read more...</div>");'' ||',
'         ''}'' ||',
'       ''});'' ||',
'       ''}''',
'    ); ',
'        ',
'     ',
'    RETURN(v_result);',
'  END;',
''))
,p_render_function=>'mbn_large_text'
,p_standard_attributes=>'JQUERY_SELECTOR:REQUIRED:ONLOAD'
,p_substitute_attributes=>true
,p_subscribe_plugin_settings=>true
,p_version_identifier=>'1.0'
,p_files_version=>3
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(21882163551419448597)
,p_plugin_id=>wwv_flow_api.id(21882161824980354426)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>1
,p_display_sequence=>10
,p_prompt=>'Width (px)'
,p_attribute_type=>'INTEGER'
,p_is_required=>true
,p_default_value=>'350'
,p_display_length=>4
,p_max_length=>4
,p_is_translatable=>false
,p_help_text=>'The maximum width of the text column when collapsed.'
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(21882163947105450541)
,p_plugin_id=>wwv_flow_api.id(21882161824980354426)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>2
,p_display_sequence=>20
,p_prompt=>'Height (px)'
,p_attribute_type=>'INTEGER'
,p_is_required=>true
,p_default_value=>'50'
,p_display_length=>4
,p_max_length=>4
,p_is_translatable=>false
,p_help_text=>'The maximum height of the column when collapsed.'
);
end;
/
begin
wwv_flow_api.g_varchar2_table := wwv_flow_api.empty_varchar2_table;
wwv_flow_api.g_varchar2_table(1) := '2F2F204A61766153637269707420446F63756D656E740D0A0D0A766172206D626E64617461203D206D626E64617461207C7C207B7D3B0D0A0D0A6D626E646174612E73686F775F6C61726765203D2066756E6374696F6E20286929207B0D0A0961706578';
wwv_flow_api.g_varchar2_table(2) := '2E6A51756572792869292E706172656E7428292E6368696C6472656E28276469763A666972737427292E63737328276F766572666C6F77272C2776697369626C6527292E6373732827686569676874272C2727293B0D0A090D0A092F2F205265706C6163';
wwv_flow_api.g_varchar2_table(3) := '652052656164206D6F726520776974682072656164206C6573730D0A092F2F617065782E6A51756572792869292E72656D6F766528293B0D0A09617065782E6A51756572792869292E68746D6C282752656164206C65737327293B0D0A09617065782E6A';
wwv_flow_api.g_varchar2_table(4) := '51756572792869292E6174747228276F6E636C69636B272C20276D626E646174612E73686F775F6C65737328746869732C20225922293B27293B0D0A7D0D0A0D0A6D626E646174612E73686F775F6C657373203D2066756E6374696F6E2028692C207429';
wwv_flow_api.g_varchar2_table(5) := '207B0D0A09766172206974203D20617065782E6A51756572792869292E706172656E7428292E6368696C6472656E28276469763A666972737427293B0D0A2020202069662028617065782E6A5175657279286974292E74657874282920213D2022222920';
wwv_flow_api.g_varchar2_table(6) := '7B0D0A202020202020617065782E6A5175657279286974292E63737328227769647468222C20617065782E6A5175657279286974292E6461746128276D626E2D77696474682729202B2027707827293B0D0A202020202020617065782E6A517565727928';
wwv_flow_api.g_varchar2_table(7) := '6974292E6373732822686569676874222C20617065782E6A5175657279286974292E6461746128276D626E2D6865696768742729202B2027707827293B0D0A202020202020617065782E6A5175657279286974292E63737328226F766572666C6F77222C';
wwv_flow_api.g_varchar2_table(8) := '2268696464656E22293B0D0A202020202020617065782E6A5175657279286974292E6373732822746578742D6F766572666C6F77222C22656C6C697073697322293B0D0A0D0A0920206966202874203D3D2022592229207B0D0A20200920202020617065';
wwv_flow_api.g_varchar2_table(9) := '782E6A51756572792869292E68746D6C282752656164206D6F72652E2E2E27293B0D0A20200920202020617065782E6A51756572792869292E6174747228276F6E636C69636B272C20276D626E646174612E73686F775F6C617267652874686973293B27';
wwv_flow_api.g_varchar2_table(10) := '293B0D0A0920207D0D0A097D0D0A7D';
null;
end;
/
begin
wwv_flow_api.create_plugin_file(
 p_id=>wwv_flow_api.id(21878897321680474370)
,p_plugin_id=>wwv_flow_api.id(21882161824980354426)
,p_file_name=>'mbn_large_text.js'
,p_mime_type=>'application/javascript'
,p_file_charset=>'utf-8'
,p_file_content=>wwv_flow_api.varchar2_to_blob(wwv_flow_api.g_varchar2_table)
);
end;
/
begin
wwv_flow_api.import_end(p_auto_install_sup_obj => nvl(wwv_flow_application_install.get_auto_install_sup_obj, false), p_is_component_import => true);
commit;
end;
/
set verify on feedback on define on
prompt  ...done
