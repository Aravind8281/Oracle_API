
-- Used to Create new record

--wip_ws_time_entry

--This API is used to insert,update,clock-in,clock-out in MES 

DECLARE
    l_time_entry_id   NUMBER;
    l_return_status   VARCHAR2(200);
BEGIN
    fnd_global.apps_initialize(
        7677,
        61916,
        706
    );
    wip_ws_time_entry.record_insert(
        p_time_entry_id               => NULL,-- Assuming a new record
        p_organization_id             => 5328,
        p_wip_entity_id               => 647013,
        p_operation_seq_num           => 10,
        p_resource_id                 => 197003,
        p_resource_seq_num            => 10,
        p_instance_id                 => 43001,
        p_serial_number               => NULL,
        p_last_update_date            => SYSDATE,-- Assuming current timestamp
        p_last_updated_by             => 1,-- Replace with appropriate user ID
        p_creation_date               => SYSDATE,
        p_created_by                  => 1,-- Replace with appropriate user ID
        p_last_update_login           => NULL,-- Replace if required
        p_object_version_num          => 1,-- Default value for new records
        p_time_entry_mode             => 4,-- Replace if needed
        p_cost_flag                   => NULL,-- Replace if required
        p_add_to_rtg                  => NULL,-- Replace if required
        p_status_type                 => 1,-- Replace if needed
        p_start_date                  => SYSDATE,
        p_end_date                    => NULL,
        p_projected_completion_date   => NULL,
        p_duration                    => NULL,
        p_uom_code                    => 'Hr',
        p_employee_id                 => 4468,
        x_time_entry_id               => l_time_entry_id,-- OUT parameter to hold generated ID
        p_reason_id                   => NULL,-- Replace if required
        p_reference                   => NULL,-- Replace if required
        p_request_id                  => NULL,-- Replace if required
        x_return_status               => l_return_status -- OUT parameter for status
    );

    Commit;

    dbms_output.put_line('Time Entry ID: ' || l_time_entry_id);
    dbms_output.put_line('Return Status: ' || l_return_status);
EXCEPTION
    WHEN OTHERS THEN
        dbms_output.put_line('Error: ' || sqlerrm);
END;
/
-- Used to clock out
DECLARE
L_status Varchar2(360);
l_msg_count number;
l_msg varchar2(2400);
BEGIN
    fnd_global.apps_initialize(
        7677,
        61916,
        706
    );
    wip_ws_time_entry.clock_out(p_wip_entity_id=>647013,
                  p_operation_seq_num =>10,
                  p_responsibility_key =>61916,
                  p_dept_id =>NULL,
                  p_employee_id =>4468,
                  p_instance_id =>43001 ,
                  p_resource_id =>197003,
                  p_resource_seq_num =>10,
                  x_status =>l_status,
                  x_msg_count=>l_msg_count,
                  x_msg=>l_msg);

    Commit;

    dbms_output.put_line('Status : ' || l_status);
    dbms_output.put_line('Return Message: ' || l_msg);
EXCEPTION
    WHEN OTHERS THEN
        dbms_output.put_line('Error: ' || sqlerrm);
END;
/

select * from WIP_RESOURCE_ACTUAL_TIMES;
