package top.macaulish.PLS.entity;

import java.sql.Timestamp;
import java.util.Objects;

public class TaskEntity {
    private int id;
    private String guid;
    private String taskname;
    private String state;
    private String targetModel;
    private Integer ftpInfoId;
    private Integer autoDownload;
    private String downloadPath;
    private Timestamp createTime;
    private int creatorId;
    private FtpInfoEntity ftpInfoByFtpInfoId;
    private UserEntity userByCreatorId;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getGuid() {
        return guid;
    }

    public void setGuid(String guid) {
        this.guid = guid;
    }

    public String getTaskname() {
        return taskname;
    }

    public void setTaskname(String taskname) {
        this.taskname = taskname;
    }

    public String getState() {
        return state;
    }

    public void setState(String state) {
        this.state = state;
    }

    public String getTargetModel() {
        return targetModel;
    }

    public void setTargetModel(String targetModel) {
        this.targetModel = targetModel;
    }

    public Integer getFtpInfoId() {
        return ftpInfoId;
    }

    public void setFtpInfoId(Integer ftpInfoId) {
        this.ftpInfoId = ftpInfoId;
    }

    public Integer getAutoDownload() {
        return autoDownload;
    }

    public void setAutoDownload(Integer autoDownload) {
        this.autoDownload = autoDownload;
    }

    public String getDownloadPath() {
        return downloadPath;
    }

    public void setDownloadPath(String downloadPath) {
        this.downloadPath = downloadPath;
    }

    public Timestamp getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Timestamp createTime) {
        this.createTime = createTime;
    }

    public int getCreatorId() {
        return creatorId;
    }

    public void setCreatorId(int creatorId) {
        this.creatorId = creatorId;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        TaskEntity that = (TaskEntity) o;
        return id == that.id &&
                creatorId == that.creatorId &&
                Objects.equals(guid, that.guid) &&
                Objects.equals(taskname, that.taskname) &&
                Objects.equals(state, that.state) &&
                Objects.equals(targetModel, that.targetModel) &&
                Objects.equals(ftpInfoId, that.ftpInfoId) &&
                Objects.equals(autoDownload, that.autoDownload) &&
                Objects.equals(downloadPath, that.downloadPath) &&
                Objects.equals(createTime, that.createTime);
    }

    @Override
    public int hashCode() {

        return Objects.hash(id, guid, taskname, state, targetModel, ftpInfoId, autoDownload, downloadPath, createTime, creatorId);
    }

    public FtpInfoEntity getFtpInfoByFtpInfoId() {
        return ftpInfoByFtpInfoId;
    }

    public void setFtpInfoByFtpInfoId(FtpInfoEntity ftpInfoByFtpInfoId) {
        this.ftpInfoByFtpInfoId = ftpInfoByFtpInfoId;
    }

    public UserEntity getUserByCreatorId() {
        return userByCreatorId;
    }

    public void setUserByCreatorId(UserEntity userByCreatorId) {
        this.userByCreatorId = userByCreatorId;
    }
}
